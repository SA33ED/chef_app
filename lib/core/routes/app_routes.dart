import 'package:chef_app/features/auth/peresentation/screens/change_lang_screen.dart';
import 'package:chef_app/features/auth/peresentation/screens/login_screen.dart';
import 'package:chef_app/features/auth/peresentation/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/peresentation/screens/send_code_screen.dart';
import 'package:chef_app/features/auth/peresentation/screens/splash_screen.dart';
import 'package:chef_app/features/menu/peresentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/peresentation/screens/menu_home_screen.dart';
import 'package:chef_app/features/profile/peresentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profile/peresentation/screens/profile_home_screen.dart';
import 'package:chef_app/features/profile/peresentation/screens/setting.dart';
import 'package:chef_app/features/profile/peresentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../features/home/screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String changeLang = '/changeLang';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String setting = '/setting';
  static const String changePassword = '/changePassword';
  static const String home = '/home';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.changeLang:
        return MaterialPageRoute(builder: (_) => const ChangeLangScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.menuHome:
        return MaterialPageRoute(builder: (_) => const MenuHomeScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
      case Routes.profileHome:
        return MaterialPageRoute(builder: (_) => const ProfileHomeScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
