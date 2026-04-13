import 'package:flutter/material.dart';

class CardGridSection extends StatelessWidget {
  const CardGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'title': 'Birthday',
        'image': 'https://picsum.photos/seed/birthday/150/200',
      },
      {
        'title': 'Wedding',
        'image': 'https://picsum.photos/seed/wedding/150/200',
      },
      {'title': 'Party', 'image': 'https://picsum.photos/seed/party/150/200'},
      {'title': 'Casual', 'image': 'https://picsum.photos/seed/casual/150/200'},
      {
        'title': 'Day Outfits',
        'image': 'https://picsum.photos/seed/day/150/200',
      },
      {
        'title': 'Night Out',
        'image': 'https://picsum.photos/seed/night/150/200',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return OutfitCard(
          title: items[index]['title']!,
          imagePath: items[index]['image']!,
        );
      },
    );
  }
}

class OutfitCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const OutfitCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.network(
              imagePath,
              height: 75,
              width: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(width: 60, height: 75);
              },
            ),
          ),
        ],
      ),
    );
  }
}
