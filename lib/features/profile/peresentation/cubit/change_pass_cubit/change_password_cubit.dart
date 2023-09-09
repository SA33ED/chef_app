import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/reposatiry/change_password_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePassRepo) : super(ChangePasswordInitial());
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final ChangePasswordRepository changePassRepo;

  //!new password
  bool isNewPasswordsShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;
  void changeNewPasswordSuffixIcon() {
    isNewPasswordsShowing = !isNewPasswordsShowing;
    suffixIconNewPassword =
        isNewPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //!old password
  bool isOldPasswordsShowing = true;
  IconData suffixIconOldPassword = Icons.visibility;
  void changeOldPasswordSuffixIcon() {
    isOldPasswordsShowing = !isOldPasswordsShowing;
    suffixIconOldPassword =
        isOldPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeOldPasswordSuffixIcon());
  }

  //!confirm password
  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;
  void confirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ConfirmPasswordSuffixIcon());
  }

  void changePassword() async {
    emit(ChangePasswordLoadingState());
    final result = await changePassRepo.changePassword(
      
      oldPass: oldPassController.text,
      newPass: newPassController.text,
      confirmPassword: confirmPassController.text,
    );
    result.fold((l) => emit(ChangePasswordErrorState(l)),
        (r) => emit(ChangePasswordSuccessState(r)));
  }
  
}
