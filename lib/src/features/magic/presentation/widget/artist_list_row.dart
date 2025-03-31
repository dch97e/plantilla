import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/shared.dart';
import '../../domain/model/card_model.dart';

class ArtistListRow extends StatelessWidget {
  const ArtistListRow({super.key, required this.card});

  final Cards card;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(card.name!),
      subtitle: Text(card.name!),
      leading: Hero(
        tag: card.id!,
        child: CircleAvatar(
          backgroundImage: card.imageUrl != null
              ? CachedNetworkImageProvider(
                  card.imageUrl!,
                  cacheManager: FileCacheManager.instance,
                )
              : null,
        ),
      ),
      onTap: (() => context.go(
            NavigationRoutes.artistDetailRoute,
            extra: card.toJson(),
          )),
    );
  }
}
