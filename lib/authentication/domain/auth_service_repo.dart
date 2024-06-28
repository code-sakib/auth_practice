import 'package:best_authentication/core/data_state/auth_fetched_state.dart';

abstract class AuthRepo {
  getAuthStateForEAndP(String email, String password);
  Future<AuthFetchedState> getAuthStateForRandF(bool isRegister, String email, String? password);

  getAuthStateForGAuth();

  getAuthStateForPN(String pN);

  getAuthStateForFAuth();

  verifyOTP(){}
}
