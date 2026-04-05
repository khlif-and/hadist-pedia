import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';
import '../templates/glow_background.dart';
import '../molecules/home_header.dart';
import '../molecules/section_title.dart';
import '../organisms/category_chip_bar.dart';
import '../organisms/quote_card.dart';
import '../organisms/dynamic_bottom_nav.dart';
import '../organisms/hadist_collection_row.dart';
import '../organisms/trending_wisdom_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isDocked = false;
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home_filled, 'label': "Home"},
    {'icon': Icons.explore_outlined, 'label': "Discover"},
    {'icon': Icons.nights_stay_outlined, 'label': "Sleep"},
    {'icon': Icons.person_outline, 'label': "Profile"},
  ];

  final List<Map<String, String>> _hadistItems = List.generate(
    4,
    (_) => {
      'title': "Al-Jami' al-Shahih",
      'description': 'Hadist populer karya imam bukhari yang...',
    },
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final shouldDock = _scrollController.offset > AppSizes.navScrollThreshold;
      if (shouldDock != _isDocked) {
        setState(() => _isDocked = shouldDock);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      extendBody: true,
      body: GlowBackground(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                SizedBox(height: AppSizes.spacingXl),
                const CategoryChipBar(
                  categories: [
                    'All',
                    'Hadith',
                    'Daily Vibe',
                    'Reflections',
                    'Audio',
                  ],
                  selectedIndex: 0,
                ),
                SizedBox(height: AppSizes.spacingSection),
                const SectionTitle(
                  label: 'FOR YOU',
                  title: 'Daily Vibe',
                  actionText: 'View History',
                ),
                SizedBox(height: AppSizes.spacingMd),
                const QuoteCard(),
                SizedBox(height: AppSizes.spacingSection),
                Padding(
                  padding: AppSizes.screenPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hadist Imam Bukhari',
                        style: AppTextStyles.headlineSmall,
                      ),
                      Text(
                        'See All',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.spacingMd),
                HadistCollectionRow(items: _hadistItems),
                SizedBox(height: AppSizes.spacingSection),
                const TrendingWisdomCard(),
                SizedBox(height: AppSizes.bottomScrollPadding),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DynamicBottomNav(
        isDocked: _isDocked,
        selectedIndex: _selectedIndex,
        items: _navItems,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
