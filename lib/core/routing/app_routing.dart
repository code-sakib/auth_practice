import 'package:best_authentication/authentication/presentation/ui/auth_view.dart';
import 'package:best_authentication/authentication/presentation/ui/widgets/auth_cases.dart';
import 'package:best_authentication/main.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouting = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const InitialPage(), routes: [
    GoRoute(
      path: 'email_cases',
      name: 'email_cases',
      builder: (context, state) {
        final AuthenticatingCasesEnum emailCase = state.extra as AuthenticatingCasesEnum;
        return AuthCases(authCase: emailCase);
      },
    )
  ])
]);
