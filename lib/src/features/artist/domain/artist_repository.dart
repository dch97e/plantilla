import 'model/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> getArtists();
}
