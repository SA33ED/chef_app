import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextOverflow extends StatelessWidget {
  const CustomTextOverflow({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 180.w),
      child: Text(text,
      overflow: TextOverflow.ellipsis,
      ),
      
      );
  }
}
