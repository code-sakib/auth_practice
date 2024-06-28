// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:best_authentication/authentication/domain/auth_service_repo.dart';
import 'package:best_authentication/authentication/domain/cubits/auth_state.dart';
import 'package:best_authentication/authentication/domain/cubits/base_cubit.dart';
import 'package:best_authentication/core/data_state/auth_fetched_state.dart';
import 'package:best_authentication/utlis/constants/strings.dart';

class AuthCubit<Auth> extends BaseCubit<AuthState> {
  final AuthRepo apiRepo;
  AuthCubit(
    this.apiRepo,
  ) : super(InitialState());

  onLoading(String? msg) => emit(AuthLoading('loading..'));

  authStateChanges() async {
    await authInstance.signOut();
    emit(InitialState());
  }

  withEAndP(String email, String password) async {
    // print('in cubit');
    final currentAuthState =
        await apiRepo.getAuthStateForEAndP(email, password);

    if (currentAuthState is AuthFetchedSucceed) {
      emit(AuthSucceed());
    } else if (currentAuthState is AuthFetchedFailed) {
      emit(AuthFailed(currentAuthState.errMsg));
    } else {
      emit(AuthFailed('Internal Err, try later.'));
    }
  }

  Future<void> ForRandF(bool isRegister, String email, String? password) async {
    // print('in cubit');
    final currentAuthState =
        await apiRepo.getAuthStateForRandF(isRegister, email, password);

    if (currentAuthState is AuthFetchedVerify) {
      emit(AuthVerifying());
    } else if (currentAuthState is AuthFetchedFailed) {
      emit(AuthFailed(currentAuthState.errMsg));
    } else {
      emit(AuthFailed('Internal Err, try later.'));
    }
  }

  Future<void> withGAuth() async {
    // print('in cubit');
    final currentAuthState = await apiRepo.getAuthStateForGAuth();

    if (currentAuthState is AuthFetchedSucceed) {
      emit(AuthSucceed());
    } else if (currentAuthState is AuthFetchedFailed) {
      emit(AuthFailed(currentAuthState.errMsg));
    } else {
      emit(AuthFailed('Internal Err, try later.'));
    }
  }

  Future<void> withFacebookAuth() async {
    final currentAuthState = await apiRepo.getAuthStateForFAuth();

    if (currentAuthState is AuthFetchedSucceed) {
      emit(AuthSucceed());
    } else if (currentAuthState is AuthFetchedFailed) {
      emit(AuthFailed(currentAuthState.errMsg));
    } else {
      emit(AuthFailed('Internal Err, try later.'));
    }
  }

  Future<void> withpN(String pN) async {
    // print('in cubit');
    final currentAuthState = await apiRepo.getAuthStateForPN(pN);

    if (currentAuthState is AuthFetchedSucceed) {
      emit(AuthSucceed());
    } else if (currentAuthState is AuthFetchedFailed) {
      emit(AuthFailed(currentAuthState.errMsg));
    } else {
      emit(AuthFailed('Internal Err, try later.'));
    }
  }

  Future<void> sendingOTP() async {
    // print('in cubit');
    final currentAuthState = await apiRepo.verifyOTP();

    if (currentAuthState is AuthFetchedSucceed) {
      emit(AuthSucceed());
    } else if (currentAuthState is AuthFetchedFailed) {
      emit(AuthFailed(currentAuthState.errMsg));
    } else {
      emit(AuthFailed('Internal Err, try later.'));
    }
  }
}
