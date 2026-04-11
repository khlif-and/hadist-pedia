import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundOnTheBackground extends StatelessWidget {
  final String imageUrl;

  const BackgroundOnTheBackground({Key? key, required this.imageUrl})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF13131A),
                      const Color(0xFF13131A).withOpacity(0.95),
                      const Color(0xFF13131A).withOpacity(0.85),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
