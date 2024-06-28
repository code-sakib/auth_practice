import 'package:best_authentication/authentication/data/authenticating_service.dart';
import 'package:best_authentication/authentication/data/base_state.dart';
import 'package:best_authentication/authentication/domain/auth_service_repo.dart';
import 'package:best_authentication/core/data_state/auth_fetched_state.dart';

class AuthRepoImpl extends BaseState implements AuthRepo {
  @override
  Future<AuthFetchedState> getAuthStateForEAndP(String email, String password) {
    return getState(() async {
      await AuthenticatingService.ePAuth(email, password);
    }, 'Login successfull', false);
  }

  @override
  Future<AuthFetchedState> getAuthStateForGAuth() {
    return getState(() async {
      await AuthenticatingService.googleAuthenticating();
    }, 'Login successfull', false);
  }

  @override
  Future<AuthFetchedState> getAuthStateForPN(String pN) {
    return getState(() async {
      await AuthenticatingService.otpSending(pN);
    }, 'Login successfull', false);
  }

  @override
  Future<AuthFetchedState> getAuthStateForFAuth() {
    return getState(() async {
      await AuthenticatingService.facebookAuthenticating();
    }, 'Login successfull', false);
  }

  @override
  getAuthStateForRandF(bool isRegister, String email, String? password) {
    return getState(() async {
      await AuthenticatingService.registerOrForgot(isRegister, email, password);
    }, '', true);
  }

  @override
  verifyOTP() {
    return getState(() async {
      await AuthenticatingService.otpVerifying();
    }, 'Login successfull', false);
  }
}
