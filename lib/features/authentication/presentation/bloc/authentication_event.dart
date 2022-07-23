part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginUserWithUsername extends AuthenticationEvent {
  final String? username;
  final String? password;

  const LoginUserWithUsername({this.username, this.password});

  @override
  List<Object> get props => [username!, password!];
}

class RegisterUserWithEmail extends AuthenticationEvent {
  final String? name;
  final String? email;
  final String? password;

  const RegisterUserWithEmail({this.name, this.email, this.password});

  @override
  List<Object> get props => [name!, email!, password!];
}
