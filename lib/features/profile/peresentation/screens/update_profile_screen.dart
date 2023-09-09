import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/profile/peresentation/cubit/update_prof_cubit/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_file_image.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import '../../../menu/peresentation/components/image_picker_dialog.dart';
import '../cubit/get_chef_data_cubit/profile_cubit.dart';
import '../cubit/update_prof_cubit/update_profile_cubit.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.editProfile.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if(state is UpdateChefSuccessState){

              // navigateReplacment(context: context, route: Routes.profileHome);
              Navigator.pop(context);
              BlocProvider.of<ProfileCubit>(context).getChefData();
            }
            
          },
          builder: (context, state) {
            final updateProfileCubit=BlocProvider.of<UpdateProfileCubit>(context);
            return Form(
              key:updateProfileCubit.updateProfileKey ,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          //image
                          CustomFileImage(image: updateProfileCubit.image,),
                          //button
                          Positioned.directional(
                            textDirection: Directionality.of(context),
                            bottom: -8,
                            end: 100,
                            child: IconButton(
                              onPressed: () {
                                 showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ImagePackerDialog(
                                        cameraOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.camera).then((value) => updateProfileCubit.changeImageUpdateProfile(value));
                                        },
                                        galleryOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.gallery).then((value) => updateProfileCubit.changeImageUpdateProfile(value));
                                        },
                                      );
                                    });
                              },
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
                      height: 24.h,
                    ),
                    //name
                    CustomTextFormField(
                      controller: updateProfileCubit.nameController,
                      hint: AppStrings.name.tr(context),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //phone
                    CustomTextFormField(
                      controller: updateProfileCubit.phoneController,
                      hint: AppStrings.phoneNumber.tr(context),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //brand name
                    CustomTextFormField(
                      controller: updateProfileCubit.brandNameController,
                      hint: AppStrings.brandName.tr(context),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //Minimum Charge
                    CustomTextFormField(
                      controller: updateProfileCubit.minimumChargeController,
                      hint: AppStrings.minimumCharge.tr(context),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //Description
                    CustomTextFormField(
                      controller: updateProfileCubit.descController,
                      hint: AppStrings.description.tr(context),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    //Location
                    CustomTextFormField(
                      controller: updateProfileCubit.locationController,
                      hint: AppStrings.location.tr(context),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is UpdateChefLoadingState
                          ? const CustomLoadingIndicator()
                          : CustomButton(
                              onPressed: () {
                                if (BlocProvider.of<UpdateProfileCubit>(context)
                                    .updateProfileKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<UpdateProfileCubit>(context)
                                      .updateChef();
                                }
                              },
                              text: AppStrings.sendResetLink.tr(context),
                            ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//formkey