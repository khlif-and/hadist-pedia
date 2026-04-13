import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/atom/shared/chip.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  color: Color(0xFFE54E70),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: const [
            CategoryChip(label: 'Echoes of the Drum', isSelected: false),
            CategoryChip(label: 'Soul of the Motherland', isSelected: false),
            CategoryChip(label: 'Heartbeat of Africa', isSelected: false),
            CategoryChip(label: 'Golden Sunset Beats', isSelected: false),
            CategoryChip(label: 'Jungle Pulse', isSelected: false),
            CategoryChip(label: 'Spirit of Ubuntu', isSelected: false),
            CategoryChip(label: 'Crave', isSelected: false),
            CategoryChip(label: 'Velvet Night', isSelected: false),
            CategoryChip(label: 'Linger', isSelected: false),
            CategoryChip(label: 'Afterglow', isSelected: false),
            CategoryChip(label: 'Rhythms of the Savannah', isSelected: false),
          ],
        ),
      ],
    );
  }
}
