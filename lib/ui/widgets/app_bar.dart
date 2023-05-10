import 'package:app/constants/constants.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:app/models/models.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final String headingText;
  final Widget coverImage;
  final Widget? backgroundImage;
  final List<Widget> actions;

  AppBar({
    Key? key,
    required this.headingText,
    required this.coverImage,
    this.backgroundImage,
    this.actions = const [],
  }) : super(key: key);

  final Widget _gradientEffect = SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            preferences.themeColors.screenHeaderBackground,
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final backgroundImage = this.backgroundImage;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 290,
      actions: actions,
      backgroundColor: preferences.themeColors.screenHeaderBackground,
      shadowColor: Colors.transparent,
      flexibleSpace: FrostedGlassBackground(
        child: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.hPadding,
            ),
            child: Text(
              headingText,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          background: Stack(
            children: <Widget>[
              if (backgroundImage != null) backgroundImage,
              _gradientEffect,
              Center(
                child: SizedBox.square(
                  dimension: 192,
                  child: coverImage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoverImageStack extends StatelessWidget {
  final List<Song> songs;

  const CoverImageStack({Key? key, required this.songs}) : super(key: key);

  bool get isEmpty => songs.isEmpty;

  @override
  Widget build(BuildContext context) {
    const imageCount = 4;
    List<String?> images = [];

    if (songs.isNotEmpty) {
      images = songs
          .where((song) => song.hasCustomImage)
          .map((song) => song.albumCoverUrl)
          .toList();

      images.shuffle();
      images = images.take(imageCount).toList();
    }

    // fill up to 4 images
    for (int i = images.length; i < imageCount; ++i) {
      images.insert(0, null);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          left: -16,
          top: -24,
          child: CoverImage(imageUrl: images[0], overlayOpacity: .8),
        ),
        Positioned(
          left: 32,
          top: -16,
          child: CoverImage(imageUrl: images[1], overlayOpacity: .6),
        ),
        Positioned(
          left: 14,
          top: 20,
          child: CoverImage(imageUrl: images[2], overlayOpacity: .4),
        ),
        CoverImage(imageUrl: images[3]),
      ],
    );
  }
}

class CoverImage extends StatelessWidget {
  final double overlayOpacity;
  final String? imageUrl;

  const CoverImage({
    Key? key,
    required this.imageUrl,
    this.overlayOpacity = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;

    return SizedBox(
      width: 160,
      height: 160,
      child: ClipSmoothRect(
        radius: SmoothBorderRadius(
          cornerRadius: 16,
          cornerSmoothing: .8,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                preferences.themeColors.screenHeaderBackground.withOpacity(overlayOpacity),
                BlendMode.srcOver,
              ),
              image: imageUrl == null
                  ? AppImages.defaultImage.image
                  : CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: preferences.themeColors.screenHeaderBackground,
                blurRadius: 10.0,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
