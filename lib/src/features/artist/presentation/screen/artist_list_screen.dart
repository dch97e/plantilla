import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../artist.dart';
import '../../domain/model/artist.dart';

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
      switch (state.status) {
        case Status.LOADING:
          LoadingOverlay.show(context);
        case Status.SUCCESS:
          LoadingOverlay.hide();
          setState(() {
            _artistList = state.data;
          });
        case Status.ERROR:
          LoadingOverlay.hide();
          ErrorOverlay.of(context).show(
            state.error,
            onRetry: _artistViewModel.fetchArtists,
          );
        default:
          LoadingOverlay.hide();
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
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: _artistList.length,
          itemBuilder: (context, index) {
            final artist = _artistList[index];

            return ListTile(
              title: Text(artist.name),
              subtitle: Text(artist.title),
              leading: Hero(
                tag: artist.id,
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(artist.avatar),
                ),
              ),
              onTap: (() => context.go(
                    NavigationRoutes.artistDetailRoute,
                    extra: artist.toJson(),
                  )),
            );
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
