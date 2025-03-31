import 'package:flutter/material.dart';

import '../../../../core/di/app_modules.dart';
import '../../../../shared/shared.dart';
import '../../domain/model/card_model.dart';
import '../../magic.dart';

class MagicListScreen extends StatefulWidget {
  const MagicListScreen({super.key});

  @override
  State<MagicListScreen> createState() => _MagicListScreenState();
}

class _MagicListScreenState extends State<MagicListScreen>
    with AutomaticKeepAliveClientMixin {
  final _artistViewModel = inject<MagicViewModel>();
  CardModel cards = CardModel(cards: List.empty());

  @override
  void initState() {
    super.initState();

    _artistViewModel.artistListState.stream.listen((state) {
      switch (state) {
        case LoadingState():
          LoadingOverlay.show(context);
        case SuccessState():
          LoadingOverlay.hide();
          setState(() {
            cards = state.data;
          });
        case ErrorState():
          LoadingOverlay.hide();
          ErrorOverlay.of(context).show(
            state.error,
            onRetry: _artistViewModel.fetchArtists,
          );
      }
    });

    _artistViewModel.fetchArtists();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.artists_title),
        centerTitle: true,
      ),
      body: RefreshIndicator.adaptive(
        child: ListView.builder(
          itemCount: cards.cards!.length,
          itemBuilder: (context, index) {
            final card = cards.cards![index];

            return ArtistListRow(card: card);
          },
        ),
        onRefresh: () async {
          _artistViewModel.fetchArtists();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _artistViewModel.dispose(); // Avoid memory leaks
  }

  @override
  bool get wantKeepAlive => true;
}
