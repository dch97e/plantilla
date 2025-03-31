import 'model/card_model.dart';

abstract class MagicRepository {
  Future<CardModel> getCards();
}
