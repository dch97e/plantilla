import 'package:flutter_mvvm/data/artist/remote/artist_remote_impl.dart';
import 'package:flutter_mvvm/domain/artist_repository.dart';
import 'package:flutter_mvvm/model/artist.dart';

class ArtistDataImpl implements ArtistRepository {
  final ArtistRemoteImpl _remoteImpl;
  ArtistDataImpl(this._remoteImpl);

  @override
  Future<List<Artist>> getArtists() {
    return _remoteImpl.getArtists();
  }
}
