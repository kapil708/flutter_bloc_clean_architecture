import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../core/error/exceptions.dart';
import '../../core/helper/global.dart';
import '../../core/route/route_names.dart';
import '../../injection_container.dart';
import 'local_data_source.dart';

Uri getUrlWithParams(String url, Map<String, dynamic> queryParameters) {
  String urlParams = queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&');

  if (urlParams.isNotEmpty) {
    url += '?$urlParams';
  }

  return Uri.parse(url);
}

Map<String, String> headers() {
  var data = {'Accept': 'application/json', 'Content-Type': 'application/json'};

  String? authToken = locator.get<LocalDataSource>().getAuthToken();
  if (authToken != null && authToken.isNotEmpty) data['Authorization'] = "Bearer $authToken";

  log("header: $data");

  return data;
}

Future<T> postRequest<T>({required http.Client client, required String api, dynamic body, required T Function(dynamic) modelFromJson}) async {
  try {
    log('Api url: $api');
    log('Api body: ${jsonEncode(body)}');

    final http.Response response = await client
        .post(
      Uri.parse(api),
      body: body != null ? jsonEncode(body) : null,
      headers: headers(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(
          "{\"message\": \"Request time out\"}",
          408,
        ); // Request Timeout response status code
      },
    );

    log('Api response: ${response.statusCode}, ${response.body}');

    var data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return modelFromJson(data['data']);
    } else {
      if (response.statusCode == 401) {
        _handleUnauthorizedUser();
      }

      return Future.error(
        RemoteException(
          statusCode: response.statusCode,
          message: data['message'] ?? (response.statusCode == 422 ? 'Validation failed' : 'Server exception'),
        ),
      );
    }
  } on Exception catch (e) {
    return Future.error(
      RemoteException(
        statusCode: e.runtimeType.hashCode,
        message: e.toString(),
      ),
    );
  }
}

void _handleUnauthorizedUser() {
  // remove local data
  LocalDataSource localDataSource = locator.get<LocalDataSource>();
  localDataSource.removeAuthToken();
  localDataSource.removeUser();

  // navigate to login
  final GlobalVariable globalVariable = locator.get<GlobalVariable>();
  globalVariable.navState.currentContext!.goNamed(RouteName.login);
}
