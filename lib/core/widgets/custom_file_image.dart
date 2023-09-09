import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_assets.dart';
import 'custom_images.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage(
      {super.key, this.image});
  final XFile? image;
  
  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
          radius: 75,
          backgroundImage: 
           FileImage(
              File(image!.path),
              
            ),
        )
        : const CustomImages(
            imgPath: AppAssets.imagePicker,
            height: 150,
          );
  }
}
