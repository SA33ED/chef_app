
import 'package:chef_app/core/local/app_loacl.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ImagePackerDialog extends StatelessWidget {
  const ImagePackerDialog({
    super.key, required this.cameraOnTap, required this.galleryOnTap,
  });
final VoidCallback cameraOnTap;
final VoidCallback galleryOnTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //camera
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.camera.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                      color: AppColors.primary),
            ),
            onTap: cameraOnTap,
          ),
          ListTile(
            leading: const Icon(
              Icons.photo,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.gallery.tr(context),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                      color: AppColors.primary),
            ),
            onTap: galleryOnTap,
          ),
          
        ],
      ),
    );
  }
}
