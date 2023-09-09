import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_images.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/peresentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import '../cubits/forget_password_cubit/cubit/forget_password_state.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          navigateReplacment(context: context, route: Routes.login);
        }, icon: const Icon(Icons.arrow_back)),
        title: Text(AppStrings.forgetPassword.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
               if(state is ForgetPasswordSuccessState){
                        showTwist(state:ToastStates.success,messege: state.message );
                        navigateReplacment(context: context, route: Routes.resetPassword);
                    }
                    if(state is ForgetPasswordErrorState){
                        showTwist(state:ToastStates.error,messege:  AppStrings.loginFailed.tr(context) );
                    }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<ForgetPasswordCubit>(context).sendCodeKey,
                child: Column(
                  children: [
                    ///image
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 26.h),
                      child: const CustomImages(
                        imgPath: AppAssets.lock,
                        fit: BoxFit.fill,
                      ),
                    ),

                    //text
                    Text(
                      AppStrings.sendResetLinkInfo.tr(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //text field
                    CustomTextFormField(
                      controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
                      hint: AppStrings.email.tr(context),
                      validate: (data) {
                              if ( data!.isEmpty || !data.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }
                    
                              return null;
                            },
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    //send code button
                    state is ForgetPasswordLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (BlocProvider.of<ForgetPasswordCubit>(context)
                                  .sendCodeKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<ForgetPasswordCubit>(context)
                                    .sendCode();
                              }
                            },
                            text: AppStrings.sendResetLink.tr(context),
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
