import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../data/data_sources/local_data_source.dart';
import '../../../domain/usecases/login_usercase.dart';

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
            String? message = _mapFailureToMessage(failure);

            if (failure.runtimeType == ValidationFailure) {
              emit(LoginStateFailed(message));
            } else {
              emit(LoginStateException(message));
            }
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

  String? _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ValidationFailure:
        ValidationFailure vf = failure as ValidationFailure;
        if (vf.errors != null) {
          return vf.errors['message']?[0] ?? vf.errors['username']?[0];
        } else {
          return vf.message;
        }
      case ServerFailure:
        return (failure as ServerFailure).message;
      case CacheFailure:
        return 'No internet connected';
      default:
        return null;
    }
  }
}
