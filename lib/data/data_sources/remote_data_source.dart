import 'package:http/http.dart' as http;

import '../models/login/login_model.dart';
import 'api_helper.dart';
import 'api_methods.dart';

abstract class RemoteDataSource {
  Future<LoginModel> login(Map<String, dynamic> body);
}

Map<String, String>? get _headers => {'Accept': 'application/json', 'Content-Type': 'application/json'};

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> login(Map<String, dynamic> body) async {
    return postRequest(
      client: client,
      api: ApiMethods.login,
      body: body,
      modelFromJson: (data) => LoginModel.fromJson(data['data']),
    );
  }
}
