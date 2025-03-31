import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../domain/model/card_model.dart';

class MagicRemoteImpl {
  MagicRemoteImpl(this._httpClient);
  final HttpClient _httpClient;

  Future<CardModel> getCards() async {
    try {
      final dynamic response = await _httpClient.dio
          .get(NetworkEndpoints.getCardUrl, queryParameters: {'page': 1});
      final cards = CardModel.fromJson(response.data);
      final cardModel = CardModel(cards: List.empty(growable: true));

      cards.cards?.forEach((element) {
        if (element.imageUrl == null) {
          return;
        }
        cardModel.cards?.add(element);
      });
      return cardModel;
    } catch (e) {
      Log.e(e.toString());
      throw RemoteErrorMapper.getException(e);
    }
  }
}
