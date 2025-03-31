import '../domain/model/card_model.dart';
import '../magic.dart';

class MagicDataImpl implements MagicRepository {
  MagicDataImpl(this._remoteImpl);
  final MagicRemoteImpl _remoteImpl;

  @override
  Future<CardModel> getCards() {
    return _remoteImpl.getCards();
  }
}
