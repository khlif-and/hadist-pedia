import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/atom/profile_header.dart';
import 'package:hadist_pedia/presentation/atom/search_header_circle.dart';
import 'package:hadist_pedia/presentation/atom/headline_header.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileHeader(),
            SearchHeaderCircle(),
          ],
        ),
        HeadlineHeader(),
      ],
    );
  }
}