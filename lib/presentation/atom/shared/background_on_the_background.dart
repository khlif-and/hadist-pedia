import 'package:flutter/material.dart';

class BackgroundOnTheBackground extends StatelessWidget {
  final String imageUrl;

  const BackgroundOnTheBackground({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            cacheWidth: 400,
            cacheHeight: 800,
            gaplessPlayback: true,
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xFF13131A),
                  const Color(0xFF13131A).withValues(alpha: 0.95),
                  const Color(0xFF13131A).withValues(alpha: 0.85),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
