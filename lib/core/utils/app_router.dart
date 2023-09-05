import 'package:chef_app/features/auth/presentation/views/change_lang_view.dart';
import 'package:chef_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(routes: [
    //!Splash View Route
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const SplashView();
      },
    ),
    //!Change Lang View Route
    GoRoute(
      path: "/changeLang",
      builder: (context, state) {
        return const ChangeLangView();
      },
    ),
  ]);
}
