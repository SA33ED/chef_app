import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/peresentation/cubits/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_images.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import '../cubits/cubit/login_state.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const CustomImages(
                    imgPath: AppAssets.backgroundTwo,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 92.h,
                  ),
                  Center(
                    child: Text(
                      AppStrings.welcomeBack.tr(context),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              //colum text form
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      showTwist(
                          state: ToastStates.success,
                          messege: AppStrings.loginSucessfully.tr(context));
                      navigateReplacment(context: context, route: Routes.home);
                    }
                    if (state is LoginErrorState) {
                      showTwist(
                          state: ToastStates.error,
                          messege: AppStrings.loginFailed.tr(context));
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<LoginCubit>(context).loginKey,
                      child: Column(
                        children: [
                          //email
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .emailController,
                            hint: AppStrings.email.tr(context),
                            validate: (data) {
                              if (data!.isEmpty ||
                                  !data.contains('@gmail.com')) {
                                return AppStrings.pleaseEnterValidEmail
                                    .tr(context);
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          //password
                          CustomTextFormField(
                            controller: BlocProvider.of<LoginCubit>(context)
                                .passwordController,
                            hint: AppStrings.password.tr(context),
                            passwordIsVisable:
                                BlocProvider.of<LoginCubit>(context)
                                    .isLoginPasswordsShowing,
                            icon:
                                BlocProvider.of<LoginCubit>(context).suffixIcon,
                            suffixIconOnPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .changeLoginPasswordSuffixIcon();
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
                          //forget password
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {
                                navigateReplacment(
                                    context: context, route: Routes.sendCode);
                              },
                              child:
                                  Text(AppStrings.forgetPassword.tr(context)),
                            ),
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          //sign in button
                          state is LoginLoadingState
                              ? const CustomLoadingIndicator()
                              : CustomButton(
                                  onPressed: () {
                                    if (BlocProvider.of<LoginCubit>(context)
                                        .loginKey
                                        .currentState!
                                        .validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .login();
                                    }
                                    //  BlocProvider.of<LoginCubit>(context).login();
                                  },
                                  text: AppStrings.signIn.tr(context),
                                ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.dontHaveAnAccount.tr(context),
                              ),
                              Text(
                                AppStrings.signUpp.tr(
                                  context,
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColors.primary, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
