import 'package:best_authentication/authentication/domain/auth_service_repo.dart';
import 'package:best_authentication/authentication/domain/cubits/auth_cubit.dart';
import 'package:best_authentication/authentication/domain/cubits/auth_state.dart';
import 'package:best_authentication/authentication/presentation/ui/auth_view.dart';
import 'package:best_authentication/core/routing/app_routing.dart';
import 'package:best_authentication/core/themeing/app_theme.dart';
import 'package:best_authentication/others/home_page.dart';
import 'package:best_authentication/utlis/Snackbar/show_snackbar.dart';
import 'package:best_authentication/utlis/locator/app_locator.dart';
import 'package:best_authentication/firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setUpDependencies();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: true));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(appLocator<AuthRepo>()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouting,
        title: 'Authentication',
        theme: AppTheme.appMainTheme(),
        scaffoldMessengerKey: Utilis.messengerKey,
      ),
    );
  }
}

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is InitialState) {
          return const AuthPage();
        } else if (state is AuthSucceed) {
          return HomePage();
        } else if (state is AuthFailed) {
          return AuthPage(
            msg: state.failedMsg,
          );
        } else if (state is AuthVerifying) {
          return const AuthPage();
        } else {
          return HomePage('unknown');
          
        }
      },
    );
  }
}
