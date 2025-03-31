import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:light_sliver_view/light_sliver_view.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../domain/model/card_model.dart';

class MagicDetailScreen extends StatefulWidget {
  const MagicDetailScreen({super.key, required this.card});
  final Cards card;

  @override
  State<MagicDetailScreen> createState() => _MagicDetailScreenState();
}

class _MagicDetailScreenState extends State<MagicDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LightSliverView(
        title: widget.card.name!,
        centerTitle: true,
        darkModeSupport: true,
        expandedHeight: AppDimens.sliverExpandedHeight,
        expandedContent: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: widget.card.id!,
              child: ColoredBox(
                color: Colors.black,
                child: Image(
                  image: CachedNetworkImageProvider(
                    widget.card.imageUrl!,
                    cacheManager: FileCacheManager.instance,
                  ),
                  fit: BoxFit.cover,
                  color: Colors.white.setOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.mediumSize),
                  child: Text(
                    widget.card.name!,
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        content: SliverFillRemaining(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.mediumSize),
              child: Text(widget.card.name!, style: AppStyles.bigTextStyle),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Share',
            onPressed: () {
              // You can use Share Plus package to share content
              // https://pub.dev/packages/share_plus
            },
          ),
        ],
      ),
    );
  }
}
