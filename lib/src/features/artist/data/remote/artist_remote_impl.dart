import '../../../../shared/shared.dart';
import '../../domain/model/artist.dart';

class ArtistRemoteImpl {
  ArtistRemoteImpl(this._httpClient);
  final HttpClient _httpClient;

  Future<List<Artist>> getArtists() async {
    try {
      final dynamic response =
          await _httpClient.dio.get(NetworkEndpoints.artistsUrl);

      return response.data['items']
          .map<Artist>((data) => Artist.fromJson(data))
          .toList();
    } catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }
}
