import 'dart:async';

import '../../../../shared/shared.dart';
import '../../auth.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel(this._authRepository);

  final AuthRepository _authRepository;

  StreamController<ResourceState> loginState =
      StreamController<ResourceState>();

  StreamController<bool> signOutState = StreamController<bool>();

  StreamController<bool> authenticatedState = StreamController<bool>();

  Future<void> login(String user, String password) async {
    loginState.add(ResourceState.loading());

    _authRepository
        .login(user, password)
        .then((value) => loginState.add(ResourceState.success(null)))
        .catchError((e) {
      loginState.add(
        ResourceState.error(
          AuthErrorBuilder.create(e, AppAction.SIGN_IN).build(),
        ),
      );
    });
  }

  Future<void> isAuthenticated() async {
    _authRepository
        .isAuthenticated()
        .then((value) => authenticatedState.add(value))
        .onError((error, stackTrace) => authenticatedState.add(false));
  }

  Future<void> signOut() async {
    _authRepository
        .signOut()
        .then((value) => signOutState.add(true))
        .onError((error, stackTrace) => signOutState.add(false));
  }

  @override
  void dispose() {
    loginState.close();
    authenticatedState.close();
  }
}
