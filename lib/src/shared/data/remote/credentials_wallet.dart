import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CredentialsWallet {
  static const refreshTokenKey = 'refresh_token';
  static const accessTokenKey = 'access_token';
  static const expiresInKey = 'expires_in';
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<String> getRefreshToken() async {
    return await _getString(refreshTokenKey);
  }

  static Future<String> getAccessToken() async {
    return await _getString(accessTokenKey);
  }

  static Future<String> getExpirationTimeStamp() async {
    return await _getInt(expiresInKey);
  }

  static Future<void> saveRefreshToken(String refreshToken) async {
    await _storeString(refreshTokenKey, refreshToken);
  }

  static Future<void> saveAccessToken(String refreshToken) async {
    await _storeString(accessTokenKey, refreshToken);
  }

  static Future<void> saveExpirationTimeStamp(int expiresIn) async {
    // Current date in millis + expiration in millis - 5 minutes in millis
    await _storeInt(
      expiresInKey,
      (DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000) - 300000),
    );
  }

  static Future<void> saveAll(dynamic jsonDecode) async {
    await saveRefreshToken(jsonDecode[refreshTokenKey]);
    await saveAccessToken(jsonDecode[accessTokenKey]);
    await saveExpirationTimeStamp(jsonDecode[expiresInKey]);
  }

  static Future<void> clearAll() async {
    await storage.delete(key: refreshTokenKey);
    await storage.delete(key: accessTokenKey);
    await storage.delete(key: expiresInKey);
  }

  static _storeString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static _getString(String key) async {
    return await storage.read(key: key) ?? '';
  }

  static _storeInt(String key, int value) async {
    await _storeString(key, value.toString());
  }

  static _getInt(String key) async {
    final string = await _getString(key);
    return int.tryParse(string) ?? 0;
  }
}
