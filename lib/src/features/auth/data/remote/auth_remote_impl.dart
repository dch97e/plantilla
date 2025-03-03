import '../../../../shared/shared.dart';

class AuthRemoteImpl {
  AuthRemoteImpl(this._httpClient);

  final HttpClient _httpClient;

  Future<void> login(String user, String password) async {
    try {
      final dynamic response = await _httpClient.dio.post(
        NetworkEndpoints.loginUrl,
        data: {'user': user, 'password': password},
      );

      await CredentialsWallet.saveAll(response.data);
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }

  Future<bool> isAuthenticated() async {
    final refreshToken = await CredentialsWallet.getRefreshToken();
    return refreshToken.isNotEmpty;
  }

  Future<void> signOut() async {
    await CredentialsWallet.clearAll();
  }
}
