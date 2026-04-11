import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/atom/home/profile_header.dart';
import 'package:hadist_pedia/presentation/atom/home/search_header_circle.dart';
import 'package:hadist_pedia/presentation/atom/hadist/headline_header.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ProfileHeader(), SearchHeaderCircle()],
        ),
        HeadlineHeader(),
      ],
    );
  }
}
