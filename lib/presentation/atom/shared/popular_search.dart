import 'package:flutter/material.dart';
import 'dot_separator.dart';

class PopularSearchSection extends StatelessWidget {
  const PopularSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "It's Popular now",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            PopularItem(title: 'Cinderella'),
            DotSeparator(),
            PopularItem(title: 'Little Red Riding Hood'),
            DotSeparator(),
            PopularItem(title: 'Snow White and the Seven Dwarfs'),
            DotSeparator(),
            PopularItem(title: 'Sleeping Beauty'),
            DotSeparator(),
            PopularItem(title: 'Rapunzel'),
            DotSeparator(),
            PopularItem(title: 'Tom Thumb'),
            DotSeparator(),
            PopularItem(title: 'Mulan-a Chinese legend Popular in many'),
            DotSeparator(),
          ],
        ),
      ],
    );
  }
}

class PopularItem extends StatelessWidget {
  final String title;

  const PopularItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFFC4C4C4),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
