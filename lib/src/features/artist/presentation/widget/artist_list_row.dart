import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/shared.dart';
import '../../domain/model/artist.dart';

class ArtistListRow extends StatelessWidget {
  const ArtistListRow({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(artist.name),
      subtitle: Text(artist.title),
      leading: Hero(
        tag: artist.id,
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            artist.avatar,
            cacheManager: FileCacheManager.instance,
          ),
        ),
      ),
      onTap: (() => context.go(
            NavigationRoutes.artistDetailRoute,
            extra: artist.toJson(),
          )),
    );
  }
}
