import 'package:chef_app/features/auth/data/reposatiry/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRep) : super(ForgetPasswordInitial());
  final AuthRepository authRep;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  void sendCode() async {
    emit(ForgetPasswordLoadingState());
    final res = await authRep.sendCode(emailController.text);
    res.fold((l) => emit(ForgetPasswordErrorState(l)),
        (r) => emit(ForgetPasswordSuccessState(r)));
  }

  //!reset password
  //* new password text field
  TextEditingController newPasswordController = TextEditingController();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  bool isNewPasswordsShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordsShowing = !isNewPasswordsShowing;
    suffixIconNewPassword =
        isNewPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;
  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  //* code
  TextEditingController codeController = TextEditingController();

  // change password method that receives new password and confirm password and code

  void resetPassword() async {
    emit(ResetPasswordLoadingState());
  final res=  await authRep.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    res.fold((l) => emit(ResetPasswordErrorState(l)),
        (r) => emit(ResetPasswordSuccessState(r)));
  }
}
