import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Cari Apa Hari ini?',
        hintStyle: const TextStyle(color: Color(0xFF888888), fontSize: 15),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF888888),
          size: 22,
        ),
        filled: true,
        fillColor: const Color(0xFF171717),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
