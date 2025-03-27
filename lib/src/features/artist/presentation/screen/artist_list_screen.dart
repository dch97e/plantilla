import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../artist.dart';
import '../../domain/model/artist.dart';
import '../widget/artist_list_row.dart';

class ArtistListScreen extends StatefulWidget {
  const ArtistListScreen({super.key});

  @override
  State<ArtistListScreen> createState() => _ArtistListScreenState();
}

class _ArtistListScreenState extends State<ArtistListScreen>
    with AutomaticKeepAliveClientMixin {
  final _artistViewModel = inject<ArtistViewModel>();
  List<Artist> _artistList = List.empty();

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
            _artistList = state.data;
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
          itemCount: _artistList.length,
          itemBuilder: (context, index) {
            final artist = _artistList[index];

            return ArtistListRow(artist: artist);
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
