import 'dart:ui';
import 'package:flutter/material.dart';

class AppStyle {
  static final ImageFilter blurBackground = ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0);
  static final Color overlayDarkBackground = Colors.black.withOpacity(0.4);
}