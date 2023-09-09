import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/peresentation/cubits/cubit/login_cubit.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/menu/peresentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/profile/peresentation/cubit/get_chef_data_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'core/services/service_locator.dart';
import 'features/auth/peresentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'features/profile/peresentation/cubit/change_pass_cubit/change_password_cubit.dart';
import 'features/profile/peresentation/cubit/update_prof_cubit/update_profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<GlobalCubit>()..getCachedLang(),
      ),
      BlocProvider(
        create: (context) => sl<LoginCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ForgetPasswordCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<HomeCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<MenuCubit>()..getAllMeals(),
      ),
      BlocProvider(
        create: (context) => sl<ProfileCubit>()..getChefData(),
      ),
      BlocProvider(
        create: (context) => sl<UpdateProfileCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ChangePasswordCubit>(),
      ),
    ],
    child: const ChefApp(),
  ));
}
