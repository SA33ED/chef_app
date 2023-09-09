
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ChangeNewPasswordSuffixIcon extends ForgetPasswordState {}
final class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState {}
final class ForgetPasswordLoadingState extends ForgetPasswordState {}
final class ForgetPasswordSuccessState extends ForgetPasswordState {
  final String message;

  ForgetPasswordSuccessState(this.message);
}
final class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;

  ForgetPasswordErrorState(this.message);
}

final class ResetPasswordLoadingState extends ForgetPasswordState {}
final class ResetPasswordSuccessState extends ForgetPasswordState {
  final String message;

  ResetPasswordSuccessState(this.message);
}
final class ResetPasswordErrorState extends ForgetPasswordState {
  final String message;

  ResetPasswordErrorState(this.message);
}
