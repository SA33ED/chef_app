import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/local/app_loacl.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_theme.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('ar', "EG"),
              Locale('en', "US"),
            ],
            locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRoutes.generateRoute,
            theme: getAppTheme(),
          );
        },
      ),
    );
  }
}
