import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:light_sliver_view/light_sliver_view.dart';

import '../../../../core/core.dart';
import '../../domain/model/artist.dart';

class ArtistDetailScreen extends StatefulWidget {
  const ArtistDetailScreen({super.key, required this.artist});
  final Artist artist;

  @override
  State<ArtistDetailScreen> createState() => _ArtistDetailScreenState();
}

class _ArtistDetailScreenState extends State<ArtistDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LightSliverView(
        title: widget.artist.name,
        centerTitle: true,
        darkModeSupport: true,
        expandedHeight: AppDimens.sliverExpandedHeight,
        expandedContent: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: widget.artist.id,
              child: ColoredBox(
                color: Colors.black,
                child: Image(
                  image: CachedNetworkImageProvider(widget.artist.avatar),
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
                    widget.artist.name,
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
              child: Text(widget.artist.title, style: AppStyles.bigTextStyle),
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
