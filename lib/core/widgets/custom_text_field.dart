import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.passwordIsVisable = false,
    this.validate,
    this.icon,
    this.suffixIconOnPressed,
  });
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;
  final bool passwordIsVisable;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primary,
      
      validator: validate,
      obscureText: passwordIsVisable,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          hintText: hint,
          labelText: label,
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(icon),color: AppColors.primary,
          )),
    );
  }
}
