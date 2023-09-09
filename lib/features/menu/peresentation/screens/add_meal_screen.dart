import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_button.dart';
import 'package:chef_app/core/widgets/custom_file_image.dart';
import 'package:chef_app/core/widgets/custom_loading_indecator.dart';
import 'package:chef_app/features/menu/peresentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../components/image_picker_dialog.dart';
import '../cubit/menu_state.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addDishToMenu.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: BlocConsumer<MenuCubit, MenuState>(
              listener: (context, state) {
                if(state is AddDishSuccessState){
                  showTwist(messege: AppStrings.mealAddedSucessfully.tr(context), state: ToastStates.success);
                Navigator.pop(context);
                BlocProvider.of<MenuCubit>(context).getAllMeals();
                }
              },
              builder: (context, state) {
                final menuCubit = BlocProvider.of<MenuCubit>(context);
                return Form(
                  key: menuCubit.addToMenuKey,
                  child: Column(
                    children: [
                      //add photo of meal
                      Stack(
                        children: [
                          //image
                          CustomFileImage(image: menuCubit.image,),
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
                                          pickImage(ImageSource.camera).then((value) => menuCubit.changeImage(value));
                                        },
                                        galleryOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.gallery).then((value) => menuCubit.changeImage(value));
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
                      SizedBox(
                        height: 16.h,
                      ),
                      //name text field
                      CustomTextFormField(
                        controller: menuCubit.mealNameController,
                        hint: AppStrings.mealName.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealName
                                .tr(context);
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //price text field
                      CustomTextFormField(
                        controller: menuCubit.mealPriceController,
                        hint: AppStrings.mealPrice.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealPrice
                                .tr(context);
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      //description text field
                      CustomTextFormField(
                        controller: menuCubit.mealDecController,
                        hint: AppStrings.mealDesc.tr(context),
                        validate: (data) {
                          if (data!.isEmpty) {
                            return AppStrings.pleaseEnterValidMealDesc
                                .tr(context);
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      //category drop menu item
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(
                            AppStrings.category.tr(context),
                          ),
                          value: menuCubit.selectedItem,
                          items: menuCubit.categoryList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (data) {
                            menuCubit.changeItem(data);
                          },
                        ),
                      )

                      //quantity or number
                      ,
                      Row(
                        children: [
                          //quantity
                          Row(
                            children: [
                              Radio(
                                  activeColor: AppColors.primary,
                                  value: 'quantity',
                                  groupValue: menuCubit.groupVal,
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  }),
                              Text(AppStrings.mealQuantity.tr(context)),
                            ],
                          ),
                          const Spacer(),
                          //number
                          Row(
                            children: [
                              Radio(
                                  activeColor: AppColors.primary,
                                  value: 'number',
                                  groupValue: menuCubit.groupVal,
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  }),
                              Text(AppStrings.mealNumber.tr(context)),
                            ],
                          )
                        ],
                      )
                      //add to menu button
                      ,
                      state is AddDishLoadingState?const CustomLoadingIndicator() :CustomButton(
                          onPressed: () {
                              if(menuCubit.addToMenuKey.currentState!.validate()){
                                menuCubit.addDishToMenu();
                              }
                          },
                          text: AppStrings.addToMenu.tr(context))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
