class NetworkEndpoints {
  static const String _baseUrl = 'http://api.magicthegathering.io/v1/';

  static String loginUrl = '${_baseUrl}oauth/token';
  static String refreshTokenUrl = '${_baseUrl}oauth/token';
  static String getCardUrl = '${_baseUrl}cards';
}
