part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginStateInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginStateLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginStateFailed extends LoginState {
  final String? message;

  LoginStateFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginStateException extends LoginState {
  final String? message;

  LoginStateException(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginStateSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}
