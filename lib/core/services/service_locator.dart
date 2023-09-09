import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/dio_consumer.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/data/reposatiry/auth_repository.dart';
import 'package:chef_app/features/auth/peresentation/cubits/cubit/login_cubit.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/menu/peresentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/profile/data/reposatiry/logout_repo.dart';
import 'package:chef_app/features/profile/peresentation/cubit/get_chef_data_cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/peresentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import '../../features/menu/data/reposatiry/menu_repo.dart';
import '../../features/profile/data/reposatiry/change_password_repo.dart';
import '../../features/profile/data/reposatiry/profile_repo.dart';
import '../../features/profile/data/reposatiry/update_repo.dart';
import '../../features/profile/peresentation/cubit/change_pass_cubit/change_password_cubit.dart';
import '../../features/profile/peresentation/cubit/update_prof_cubit/update_profile_cubit.dart';

final sl=GetIt.instance;
void initServiceLocator(){
  //external
  sl.registerLazySingleton(() => CacheHelper());
  //cubits
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AuthRepository());
  sl.registerLazySingleton(() => MenuRepository());
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => ChangePasswordCubit(sl()));
  sl.registerLazySingleton(() => ChangePasswordRepository());
  sl.registerLazySingleton(() => UpdateProfileCubit(sl()));
  sl.registerLazySingleton(() => ProfileCubit(sl(),sl()));
  sl.registerLazySingleton(() => ProfileRepository());
  sl.registerLazySingleton(() => LogoutRepository());
  sl.registerLazySingleton(() => UpdateProfileRepository());

  sl.registerLazySingleton(() => MenuCubit(sl()));
}