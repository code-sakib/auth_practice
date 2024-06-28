// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:best_authentication/authentication/presentation/ui/widgets/auth_cases.dart';
import 'package:best_authentication/utlis/Snackbar/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:best_authentication/authentication/domain/cubits/auth_cubit.dart';
import 'package:best_authentication/authentication/presentation/ui/widgets/basic_tf.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
    this.msg,
  }) : super(key: key);

  static const EmailTextField emailObj = EmailTextField();
  static const PasswordTextField passwordObj = PasswordTextField();
  static const PhoneNumberTF pNObj = PhoneNumberTF();

  final String? msg;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 10,
              children: [
                widget.msg != null
                    ? Builder(
                        builder: (context) {
                          WidgetsBinding.instance.addPostFrameCallback(
                              (timeStamp) =>
                                  showSnackBar(context, widget.msg ?? 'Err..'));
                          return Container();
                        },
                      )
                    : Container(),
                const Icon(
                  Icons.lock_rounded,
                  size: 80,
                ),
                const Text("Welcome back you've been missed!"),
                AuthPage.emailObj,
                AuthPage.passwordObj,
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).withEAndP(
                            AuthPage.emailObj.text.trim(),
                            AuthPage.passwordObj.text.trim());
                      },
                      child: const Text('Sign in')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          context.goNamed('email_cases',
                              extra: AuthenticatingCasesEnum.register);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.blue),
                        )),
                    TextButton(
                        onPressed: () {
                          context.goNamed('email_cases',
                              extra: AuthenticatingCasesEnum.forgetPassword);
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      divider(),
                      const Text('  with OTP  '),
                      divider()
                    ],
                  ),
                ),
                AuthPage.pNObj,
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .withpN(AuthPage.pNObj.text.trim());
                        context.goNamed('email_cases',
                            extra: AuthenticatingCasesEnum.otp);
                      },
                      child: const Text('Get OTP')),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      divider(),
                      const Text('  or with socials  '),
                      divider()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    authProviderWidget(FontAwesomeIcons.facebook,
                        BlocProvider.of<AuthCubit>(context).withFacebookAuth),
                    authProviderWidget(FontAwesomeIcons.google,
                        BlocProvider.of<AuthCubit>(context).withGAuth),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget authProviderWidget(IconData icon, void Function() blocMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 60,
        width: 60,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () => blocMethod(),
                icon: Icon(
                  icon,
                ))),
      ),
    );
  }

  SizedBox divider() {
    return const SizedBox(
      width: 100,
      child: Divider(
        thickness: 2,
      ),
    );
  }
}
