import 'package:best_authentication/authentication/domain/cubits/auth_cubit.dart';
import 'package:best_authentication/utlis/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage([this.text = 'home']);

  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
          ),
          Text(
            "You've successfully signed in.",
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).authStateChanges();
              },
              child: Text('sign out')),
        ],
      ),
    );
  }
}
