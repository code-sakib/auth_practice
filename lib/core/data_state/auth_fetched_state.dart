// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthFetchedState {}

class AuthFetchedSucceed extends AuthFetchedState {
  final String? authSucceedMsg;
  AuthFetchedSucceed({
    this.authSucceedMsg,
  });
}

class AuthFetchedVerify extends AuthFetchedState {
  final String? authSucceedMsg;
  AuthFetchedVerify({
    this.authSucceedMsg,
  });
}

class AuthFetchedFailed extends AuthFetchedState {
  String? errMsg;
  AuthFetchedFailed({
    this.errMsg,
  });
}
