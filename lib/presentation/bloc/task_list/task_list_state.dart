import 'package:esstuflutter/presentation/bloc/base/state_base.dart';

abstract class LoginState extends StateBase {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSigned extends LoginState {
  const LoginSigned();
}

class LoginError extends LoginState {
  final String message;

  const LoginError({this.message});
}
