import 'dart:async';

import '../../../../shared/shared.dart';
import '../../artist.dart';

class ArtistViewModel extends BaseViewModel {
  ArtistViewModel(this._artistRepository);
  final ArtistRepository _artistRepository;

  StreamController<ResourceState> artistListState =
      StreamController<ResourceState>();

  Future<void> fetchArtists() async {
    artistListState.add(LoadingState());

    _artistRepository
        .getArtists()
        .then((value) => artistListState.add(SuccessState(value)))
        .catchError((e) {
      artistListState.add(
        ErrorState(
          ArtistErrorBuilder.create(e, AppAction.GET_ARTISTS).build(),
        ),
      );
    });
  }

  @override
  void dispose() {
    artistListState.close();
  }
}
