import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextButtonIcon extends StatelessWidget {
  const CustomTextButtonIcon({
    super.key, required this.label, required this.icon, required this.onPressed,
  });
  final Widget label;
  final Widget icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style:  const ButtonStyle(
        iconColor: MaterialStatePropertyAll(AppColors.primary),
      ),
      onPressed: onPressed,
      icon: icon,
      label: label,
    );
  }
}
