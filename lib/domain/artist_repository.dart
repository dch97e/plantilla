import 'package:flutter_mvvm/model/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> getArtists();
}
