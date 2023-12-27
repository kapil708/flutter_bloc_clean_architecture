import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/data_sources/local_data_source.dart';
import '../../../domain/use_cases/login_user_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LocalDataSource localDataSource;

  LoginBloc({required this.loginUseCase, required this.localDataSource}) : super(LoginStateInitial()) {
    on<LoginClick>((event, emit) async {
      try {
        emit(LoginStateLoading());

        var formData = {
          "username": event.userName,
          "password": event.password,
        };

        final response = await loginUseCase.call(formData);

        response.fold(
          (failure) {
            emit(LoginStateFailed(failure.message));
          },
          (data) {
            String authToken = data.token;

            print("::: authToken : $authToken");

            localDataSource.cacheAuthToken(authToken);
            emit(LoginStateSuccess());
          },
        );
      } on Exception catch (e) {
        emit(LoginStateException(e.toString()));
      }
    });
  }
}
