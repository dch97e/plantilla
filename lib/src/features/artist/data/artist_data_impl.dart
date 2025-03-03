import '../artist.dart';
import '../domain/model/artist.dart';

class ArtistDataImpl implements ArtistRepository {
  ArtistDataImpl(this._remoteImpl);
  final ArtistRemoteImpl _remoteImpl;

  @override
  Future<List<Artist>> getArtists() {
    return _remoteImpl.getArtists();
  }
}
