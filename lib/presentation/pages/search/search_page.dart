import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/molecules/search/categories_section.dart';
import '../../atom/shared/search_bar.dart';
import '../../atom/shared/popular_search.dart';
import '../../atom/shared/card_grid.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              SizedBox(height: 36),
              PopularSearchSection(),
              SizedBox(height: 36),
              CategoriesSection(),
              SizedBox(height: 36),
              CardGridSection(),
            ],
          ),
        ),
      ),
    );
  }
}
