import 'package:flutter/material.dart';

class BottomIconsButtonBar {
  static List<BottomNavigationBarItem> get items => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_open_outlined),
          label: 'Spaces',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: 'Hub',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline_rounded),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'Explore',
        ),
      ];
}