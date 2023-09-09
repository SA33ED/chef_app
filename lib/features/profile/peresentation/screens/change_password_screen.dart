import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/features/profile/peresentation/cubit/change_pass_cubit/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_images.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubit/change_pass_cubit/change_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading:
            IconButton(onPressed: () {
              navigateReplacment(context: context, route: Routes.profileHome);
            }, icon: const Icon(Icons.arrow_back)),
        title: Text(AppStrings.changePassword.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccessState) {
                // show message
                showTwist(state: ToastStates.success, messege: state.message);
                // navigate to login screen
                navigateReplacment(context: context, route: Routes.login);
              }
            },
            builder: (context, state) {
              final changePasswordCubit =
                  BlocProvider.of<ChangePasswordCubit>(context);
              return Form(
                key: changePasswordCubit.changePasswordKey,
                child: Column(
                  children: [
                    ///image
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      child: const CustomImages(
                        width: 300,
                        height: 300,
                        imgPath: AppAssets.lock,
                        // fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.changePassword.tr(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //text field => oldPassword
                    CustomTextFormField(
                      controller: changePasswordCubit.oldPassController,
                      hint: AppStrings.oldPassword.tr(context),
                      passwordIsVisable:
                          changePasswordCubit.isOldPasswordsShowing,
                      icon: changePasswordCubit.suffixIconOldPassword,
                      suffixIconOnPressed: () {
                        changePasswordCubit.changeOldPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //text field => new password
                    CustomTextFormField(
                      controller: changePasswordCubit
                          .newPassController,
                      hint: AppStrings.newPassword.tr(context),
                      passwordIsVisable:
                          changePasswordCubit
                              .isNewPasswordsShowing,
                      icon: changePasswordCubit
                          .suffixIconNewPassword,
                      suffixIconOnPressed: () {
                        changePasswordCubit
                            .changeNewPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (data !=
                            changePasswordCubit
                                .newPassController
                                .text) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //text field => confirm password
                    CustomTextFormField(
                      controller: changePasswordCubit
                          .confirmPassController,
                      hint: AppStrings.confirmPassword.tr(context),
                      passwordIsVisable:
                          changePasswordCubit
                              .isConfirmPasswordsShowing,
                      icon: changePasswordCubit
                          .suffixIconConfirmPassword,
                      suffixIconOnPressed: () {
                        changePasswordCubit
                            .confirmPasswordSuffixIcon();
                      },
                      validate: (data) {
                        if (data!.length < 6 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }
                        if (data !=
                            changePasswordCubit
                                .confirmPassController
                                .text) {
                          return AppStrings.pleaseEnterValidPassword
                              .tr(context);
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //send code button
                    state is ChangePasswordLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (changePasswordCubit
                                  .changePasswordKey
                                  .currentState!
                                  .validate()) {
                                changePasswordCubit
                                    .changePassword();
                              }
                            },
                            text: AppStrings.createYourNewPassword.tr(context),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
