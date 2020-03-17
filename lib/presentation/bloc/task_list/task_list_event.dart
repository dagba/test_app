import 'package:testapp/presentation/bloc/base/event_base.dart';

abstract class LoginEvent extends EventBase {
  const LoginEvent();
}

class LoginSigning extends LoginEvent {
  final String username;
  final String password;

  const LoginSigning({this.username, this.password});
}

class LoginRestore extends LoginEvent {
  const LoginRestore();
}
