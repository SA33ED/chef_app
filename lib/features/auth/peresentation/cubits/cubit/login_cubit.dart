import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/reposatiry/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../core/services/service_locator.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authrepo) : super(LoginInitial());
  final AuthRepository authrepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.visibility;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    suffixIcon =
        isLoginPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  LoginModel? loginModel;
  // login method
  void login() async {
    emit(LoginLoadingState());
    final result = await authrepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((l) => emit(LoginErrorState(l)), (r) async {
      loginModel = r;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      await sl<CacheHelper>()
          .saveData(key: Apikeys.id, value: decodedToken[Apikeys.id]);
      await sl<CacheHelper>().saveData(
        key: Apikeys.token,
        value: r.token,
      );
      emit(LoginSuccessState());
    });
  }
}
