import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../utils/app_colors.dart';

class CustomGNav extends StatelessWidget {
  const CustomGNav({
    super.key,
    required this.currentIndex,
    this.onChanged,
    required this.tabs,
  });
  final int currentIndex;
  final Function(int)? onChanged;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: GNav(
          selectedIndex: currentIndex,
          activeColor: AppColors.primary,
          gap: 8,
          padding: const EdgeInsets.all(16),
          tabBorderRadius: 16,
          onTabChange: onChanged,
          tabBackgroundColor: AppColors.black12,
          tabs: tabs),
    );
  }
}
