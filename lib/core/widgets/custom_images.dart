import 'package:flutter/material.dart';

class CustomImages extends StatelessWidget {
  const CustomImages({
    super.key,
    required this.imgPath,
    this.height,
    this.width,
    this.fit ,
  });
  final String imgPath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      fit: fit,
      height: height,
      width: double.infinity,
    );
  }
}
