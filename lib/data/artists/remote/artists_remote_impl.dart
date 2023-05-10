import 'package:flutter_mvvm/data/remote/error/remote_error_mapper.dart';
import 'package:flutter_mvvm/data/remote/http_client.dart';
import 'package:flutter_mvvm/data/remote/network_endpoints.dart';
import 'package:flutter_mvvm/model/artist.dart';

class ArtistsRemoteImpl {
  final HttpClient _httpClient;
  ArtistsRemoteImpl(this._httpClient);

  Future<List<Artist>> getArtists() async {
    try {
      dynamic response = await _httpClient.dio.get(NetworkEndpoints.artistsUrl);

      return response.data['items']
          .map<Artist>((data) => Artist.fromJson(data))
          .toList();
    } on Exception catch (e) {
      throw RemoteErrorMapper.getException(e);
    }
  }
}
