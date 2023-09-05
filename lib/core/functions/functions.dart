import 'package:go_router/go_router.dart';

void navigationAfterThreeSeconds(context) {
  Future.delayed(const Duration(seconds: 2), () {
    GoRouter.of(context).push("/changeLang");
  });
}
