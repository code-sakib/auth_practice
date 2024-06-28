import 'package:best_authentication/authentication/data/auth_repo_impl.dart';
import 'package:best_authentication/authentication/domain/auth_service_repo.dart';
import 'package:get_it/get_it.dart';

final appLocator = GetIt.instance;

Future<void> setUpDependencies() async {
  appLocator.registerSingleton<AuthRepo>(AuthRepoImpl());
}
