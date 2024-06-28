// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthState {}

class AuthLoading extends AuthState {
  String? authMsg;
  AuthLoading(
    this.authMsg,
  );
}

class InitialState extends AuthState {}

class GoogleAuthenticating extends AuthState {}

class AppleAuthenticating extends AuthState {}

class AuthSucceed extends AuthState {}
class AuthVerifying extends AuthState {}

class AuthFailed extends AuthState {
  String? 
  
  failedMsg;
  AuthFailed(
    this.failedMsg,
  );
}
