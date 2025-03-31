import 'package:get_it/get_it.dart';

import '../../features/auth/auth.dart';
import '../../features/magic/magic.dart';
import '../../shared/shared.dart';

final inject = GetIt.instance;

class AppModules {
  void setup() {
    _setupMainModule();
    _setupAuthModule();
    _setupMagicModule();
  }

  _setupMainModule() {
    inject.registerSingleton(HttpClient());
  }

  _setupAuthModule() {
    inject
      ..registerFactory(() => AuthRemoteImpl(inject.get()))
      ..registerFactory<AuthRepository>(() => AuthDataImpl(inject.get()))
      ..registerFactory(() => AuthViewModel(inject.get()));
  }

  _setupMagicModule() {
    inject
      ..registerFactory(() => MagicRemoteImpl(inject.get()))
      ..registerFactory<MagicRepository>(() => MagicDataImpl(inject.get()))
      ..registerFactory(() => MagicViewModel(inject.get()));
  }
}
