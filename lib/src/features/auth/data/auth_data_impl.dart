import '../auth.dart';

class AuthDataImpl implements AuthRepository {
  AuthDataImpl(this._remoteImpl);

  final AuthRemoteImpl _remoteImpl;

  @override
  Future<void> login(String user, String password) {
    return _remoteImpl.login(user, password);
  }

  @override
  Future<bool> isAuthenticated() {
    return _remoteImpl.isAuthenticated();
  }

  @override
  Future<void> signOut() {
    return _remoteImpl.signOut();
  }
}
