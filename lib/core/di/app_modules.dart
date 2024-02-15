import 'package:flutter_mvvm/data/artist/artist_data_impl.dart';
import 'package:flutter_mvvm/data/artist/remote/artist_remote_impl.dart';
import 'package:flutter_mvvm/data/auth/auth_data_impl.dart';
import 'package:flutter_mvvm/data/auth/remote/auth_remote_impl.dart';
import 'package:flutter_mvvm/data/remote/http_client.dart';
import 'package:flutter_mvvm/domain/artist_repository.dart';
import 'package:flutter_mvvm/domain/auth_repository.dart';
import 'package:flutter_mvvm/presentation/view/artist/viewmodel/artist_view_model.dart';
import 'package:flutter_mvvm/presentation/view/auth/viewmodel/auth_view_model.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

class AppModules {
  setup() {
    _setupMainModule();
    _setupAuthModule();
    _setupArtistModule();
  }

  _setupMainModule() {
    inject.registerSingleton(HttpClient());
  }

  _setupAuthModule() {
    inject.registerFactory(() => AuthRemoteImpl(inject.get()));
    inject.registerFactory<AuthRepository>(() => AuthDataImpl(inject.get()));
    inject.registerFactory(() => AuthViewModel(inject.get()));
  }

  _setupArtistModule() {
    inject.registerFactory(() => ArtistRemoteImpl(inject.get()));
    inject
        .registerFactory<ArtistRepository>(() => ArtistDataImpl(inject.get()));
    inject.registerFactory(() => ArtistViewModel(inject.get()));
  }
}
