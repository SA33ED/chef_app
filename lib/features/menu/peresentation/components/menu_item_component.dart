import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/menu/peresentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/custom_text_overflow.dart';
import '../../data/models/menu_model.dart';
import '../cubit/menu_state.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
    required this.model,
  });
  final MealModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: CustomCachedNetworkImage(imageUrl: model.images[0]),
          // Image.network(''),
        ),
        SizedBox(
          width: 8.w,
        ),
        //column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextOverflow(text: model.name),
            CustomTextOverflow(text: model.description),
            // Container(
            //   constraints: BoxConstraints(maxWidth: 180.w),
            //   child: Text(model.description,
            //   overflow: TextOverflow.ellipsis,
            //   ),
              
            //   ),
            Text(model.price.toString()+AppStrings.le.tr(context)),
          ],
        ),
        const Spacer(),
        BlocConsumer<MenuCubit, MenuState>(
          listener:(context, state){
            if(state is DeleteDishSuccessState){
              BlocProvider.of<MenuCubit>(context).getAllMeals();
            }
          } ,
          builder: (context, state) {
            return  IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        message: AppStrings.delete.tr(context),
                        confirmAction: () {
                          BlocProvider.of<MenuCubit>(context).deleteDish(model.id);
                          Navigator.pop(context);
                        },
                      );
                    });
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 40,
              ),
            );
          },
        )
      ],
    );
  }
}

