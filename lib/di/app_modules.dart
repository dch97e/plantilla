import 'package:flutter_mvvm/data/artists/artists_data_impl.dart';
import 'package:flutter_mvvm/data/artists/remote/artists_remote_impl.dart';
import 'package:flutter_mvvm/data/auth/auth_data_impl.dart';
import 'package:flutter_mvvm/data/auth/remote/auth_remote_impl.dart';
import 'package:flutter_mvvm/data/remote/http_client.dart';
import 'package:flutter_mvvm/domain/artists_repository.dart';
import 'package:flutter_mvvm/domain/auth_repository.dart';
import 'package:flutter_mvvm/presentation/view/artist/viewmodel/artists_view_model.dart';
import 'package:flutter_mvvm/presentation/view/auth/viewmodel/auth_view_model.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

class AppModules {
  setup() {
    _setupMainModule();
    _setupAuthModule();
    _setupArtistsModule();
  }

  _setupMainModule() {
    inject.registerSingleton(HttpClient());
  }

  _setupAuthModule() {
    inject.registerFactory(() => AuthRemoteImpl(inject.get()));
    inject.registerFactory<AuthRepository>(() => AuthDataImpl(inject.get()));
    inject.registerFactory(() => AuthViewModel(inject.get()));
  }

  _setupArtistsModule() {
    inject.registerFactory(() => ArtistsRemoteImpl(inject.get()));
    inject.registerFactory<ArtistsRepository>(
        () => ArtistsDataImpl(inject.get()));
    inject.registerFactory(() => ArtistsViewModel(inject.get()));
  }
}
