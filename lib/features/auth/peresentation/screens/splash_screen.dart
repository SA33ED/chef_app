// ignore_for_file: use_build_context_synchronously

import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await sl<CacheHelper>().getData(
                key: Apikeys.token,
              ) ==
              null
          ? navigate(context: context, route: Routes.changeLang)
          : navigate(context: context, route: Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImages(
              imgPath: AppAssets.appLogo,
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              AppStrings.chefApp.tr(context),
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
