import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/cubit/global_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  // final _controller = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Row(
              children: [
                Text(
                  AppStrings.language.tr(context),
                  // style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                
                Switch(
                  activeColor: AppColors.primary,
                  value: BlocProvider.of<GlobalCubit>(context).switchOn,
                  onChanged: (value) {
                    BlocProvider.of<GlobalCubit>(context).switchLang(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
