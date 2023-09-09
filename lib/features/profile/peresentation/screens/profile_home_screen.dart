import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/features/profile/peresentation/cubit/get_chef_data_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import '../../../../core/widgets/custom_text_icon_button.dart';
import '../cubit/get_chef_data_cubit/profile_state.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            
            if (state is LogoutChefSuccessState) {
              showTwist(
                  state: ToastStates.success,
                  messege: AppStrings.logoutSucessfully.tr(context));
              navigateReplacment(context: context, route: Routes.login);
            }
            if (state is LogoutChefLoadingState) {
              showTwist(
                  state: ToastStates.error,
                  messege: AppStrings.logout.tr(context));
            }
          },
          builder: (context, state) {
            final profileCubit = BlocProvider.of<ProfileCubit>(context);
            return state is GetChefDataLoadingState
                ? const CustomLoadingIndicator()
                : Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              //image
                              const CircleAvatar(
                                radius: 75,
                                backgroundImage: AssetImage(AppAssets.profile),
                                // child: CustomImages(
                                //   imgPath: AppAssets.profile,
                                //   height: 160,
                                //   width: 150,
                                // ),
                              ),
                              //button
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                bottom: -8,
                                end: 100,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Container(
                                    height: 35.h,
                                    width: 35.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.orangeTwo,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(
                                      Icons.edit,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Center(child: Text(profileCubit.getChefModel!.name)),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(child: Text(profileCubit.getChefModel!.email)),
                        SizedBox(
                          height: 20.h,
                        ),
                        //!edit profile
                        CustomTextButtonIcon(
                          onPressed: () {
                            navigate(
                                context: context, route: Routes.updateProfile);
                          },
                          icon: const Icon(Icons.person),
                          label: Text(AppStrings.editProfile.tr(context)),
                        ),

                        // SizedBox(
                        //   height: 20.h,
                        // ),

                        //!password
                        CustomTextButtonIcon(
                          onPressed: () {
                            navigate(
                                context: context, route: Routes.changePassword);
                          },
                          icon: const Icon(Icons.lock),
                          label: Text(AppStrings.password.tr(context)),
                        ),

                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        //!Settings
                        CustomTextButtonIcon(
                          onPressed: () {
                            navigate(context: context, route: Routes.setting);
                            // Navigator.pop(context);
                          },
                          icon: const Icon(Icons.settings),
                          label: Text(AppStrings.settings.tr(context)),
                        ),
                        //!Logout
                        state is LogoutChefLoadingState?const CustomLoadingIndicator(): CustomTextButtonIcon(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomAlertDialog(
                                    message: AppStrings.logout.tr(context),
                                    confirmAction: () {
                                      BlocProvider.of<ProfileCubit>(context)
                                          .logoutChef();

                                      // BlocProvider.of<MenuCubit>(context).deleteDish(model.id);
                                      // Navigator.pop(context);
                                    },
                                  );
                                });
                          },
                          icon: const Icon(Icons.logout),
                          label: Text(AppStrings.logout.tr(context)),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
