import 'dart:async';

import '../../../../shared/shared.dart';
import '../../magic.dart';

class MagicViewModel extends BaseViewModel {
  MagicViewModel(this._magicRepository);
  final MagicRepository _magicRepository;

  StreamController<ResourceState> artistListState =
      StreamController<ResourceState>();

  Future<void> fetchArtists() async {
    artistListState.add(LoadingState());

    _magicRepository
        .getCards()
        .then((value) => artistListState.add(SuccessState(value)))
        .catchError((e) {
      artistListState.add(
        ErrorState(
          MagicErrorBuilder.create(e, AppAction.GET_ARTISTS).build(),
        ),
      );
    });
  }

  @override
  void dispose() {
    artistListState.close();
  }
}
