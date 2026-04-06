import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/atom/icons_bottom_bar.dart';

class ButtonBottomBar {
  static List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(IconsBottomBar.spaces),
      label: 'Spaces',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconsBottomBar.hub),
      label: 'Hub',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconsBottomBar.library),
      label: 'Library',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconsBottomBar.explore),
      label: 'Explore',
    ),
  ];
}