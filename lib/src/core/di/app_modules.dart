import 'package:get_it/get_it.dart';

import '../../features/artist/artist.dart';
import '../../features/auth/auth.dart';
import '../../shared/shared.dart';

final inject = GetIt.instance;

class AppModules {
  void setup() {
    _setupMainModule();
    _setupAuthModule();
    _setupArtistModule();
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

  _setupArtistModule() {
    inject
      ..registerFactory(() => ArtistRemoteImpl(inject.get()))
      ..registerFactory<ArtistRepository>(() => ArtistDataImpl(inject.get()))
      ..registerFactory(() => ArtistViewModel(inject.get()));
  }
}
