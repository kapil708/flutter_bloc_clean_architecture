part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginClick extends LoginEvent {
  final String userName;
  final String password;

  LoginClick(this.userName, this.password);

  @override
  List<Object?> get props => [userName, password];
}
