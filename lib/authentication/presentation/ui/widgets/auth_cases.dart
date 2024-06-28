import 'package:best_authentication/authentication/domain/cubits/auth_cubit.dart';
import 'package:best_authentication/utlis/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum AuthenticatingCasesEnum { forgetPassword, register, otp }

class AuthCases extends StatelessWidget {
  const AuthCases({
    super.key,
    required this.authCase,
  });

  final AuthenticatingCasesEnum authCase;
  static final TextEditingController _emailandRController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  Map get getcurrentCase {
    switch (authCase) {
      case AuthenticatingCasesEnum.register:
        return {
          'title': 'Create Account',
          'hintText': 'Email',
          'buttonText': 'Verify Email',
        };

      case AuthenticatingCasesEnum.forgetPassword:
        return {
          'title': 'Forget Password',
          'hintText': 'Email',
          'buttonText': 'Change Password',
        };
      case AuthenticatingCasesEnum.otp:
        return {
          'title': 'OTP',
          'hintText': 'Enter OTP',
          'buttonText': 'Submit OTP',
        };

      default:
        return {
          'title': 'null',
          'hintText': 'null',
          'buttonText': 'null',
          'buttonFunction': 'null'
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = getcurrentCase['title'];
    final hintText = getcurrentCase['hintText'];
    final buttonText = getcurrentCase['buttonText'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 350,
              child: TextField(
                controller: _emailandRController,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            authCase == AuthenticatingCasesEnum.register
                ? SizedBox(
                    height: 100,
                    width: 350,
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  )
                : Container(),
            ElevatedButton(
                onPressed: () async {
                  if (authCase == AuthenticatingCasesEnum.register) {
                    await BlocProvider.of<AuthCubit>(context).ForRandF(
                        true,
                        _emailandRController.text.trim(),
                        _passwordController.text.trim());

                    context.pop();

                    _emailandRController.clear();
                    _passwordController.clear();
                  } else if (authCase ==
                      AuthenticatingCasesEnum.forgetPassword) {
                    await BlocProvider.of<AuthCubit>(context).ForRandF(
                        false, _emailandRController.text.trim(), null);

                    context.pop();
                    _emailandRController.clear();
                  } else if (authCase == AuthenticatingCasesEnum.otp) {
                    smsCode = _emailandRController.text.trim();
                    await BlocProvider.of<AuthCubit>(context).sendingOTP();

                    Future.delayed(
                        const Duration(
                          seconds: 5,
                        ), () {
                      context.pop();
                    });
                    _emailandRController.clear();
                  }
                },
                child: Text(buttonText)),
          ],
        ),
      ),
    );
  }
}
