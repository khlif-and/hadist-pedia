import 'package:flutter/material.dart';

class TrendingItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TrendingItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFC4C4C4),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
