import 'package:best_authentication/utlis/Snackbar/show_snackbar.dart';
import 'package:best_authentication/utlis/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthenticatingService {
  static ePAuth(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<void> registerOrForgot(
      bool isRegister, String email, String? password) async {
    if (isRegister) {
      await authInstance.createUserWithEmailAndPassword(
          email: email, password: password!);

      if (authInstance.currentUser != null) {
        if (!authInstance.currentUser!.emailVerified) {
          Future.delayed(
              const Duration(
                seconds: 10,
              ), () async {
            await authInstance.currentUser!.sendEmailVerification();
            Utilis.showSnackBar('Your account successfully created',
                color: Colors.green);
          });
        }
      }
    } else {
      await authInstance.sendPasswordResetEmail(email: email);
      Utilis.showSnackBar('Check your email to reset the password.',
          color: Colors.green);
    }
  }

  static googleAuthenticating() async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

    final OAuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

    return await authInstance.signInWithCredential(credentials);
  }

  static facebookAuthenticating() async {
    await FacebookAuth.instance.logOut();
    final LoginResult fUser = await FacebookAuth.instance.login();

    if (fUser.status == LoginStatus.success) {
      final fCredentials =
          FacebookAuthProvider.credential(fUser.accessToken!.token);

      return await authInstance.signInWithCredential(fCredentials);
    } else {
      throw FirebaseAuthException(
          code: fUser.message ?? 'FaceBook internal Err..');
    }
  }

  static otpSending(String pNumber) async {
    await authInstance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credentials) {
          fetchedVerificationId = credentials.verificationId;
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw FirebaseAuthException(code: '000');
        },
        codeSent: (String codesent, int? resetCode) {},
        codeAutoRetrievalTimeout: (String timeout) {},
        phoneNumber: '+91$pNumber');
  }

  static otpVerifying() async {
    final credentials = PhoneAuthProvider.credential(
        verificationId: fetchedVerificationId ?? '', smsCode: smsCode ?? '');

    await authInstance.signInWithCredential(credentials);
  }
}
