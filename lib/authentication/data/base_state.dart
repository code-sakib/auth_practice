import 'package:best_authentication/core/data_state/auth_fetched_state.dart';
import 'package:best_authentication/utlis/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BaseState {
  Future<AuthFetchedState> getState(
      Future Function() request, String msg, bool toVerify) async {
    try {
      await request();

      if (toVerify) return AuthFetchedVerify();

      if (authInstance.currentUser != null) {
        return AuthFetchedSucceed(authSucceedMsg: msg);
      } else {
        return AuthFetchedFailed(errMsg: 'unknown Err..');
      }
    } on FirebaseAuthException catch (e) {
      return AuthFetchedFailed(errMsg: e.message);
    }
  }
}
