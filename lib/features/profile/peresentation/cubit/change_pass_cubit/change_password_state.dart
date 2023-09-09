sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangeNewPasswordSuffixIcon extends ChangePasswordState {}

final class ChangeOldPasswordSuffixIcon extends ChangePasswordState {}

final class ConfirmPasswordSuffixIcon extends ChangePasswordState {}
final class ChangePasswordLoadingState extends ChangePasswordState {}
final class ChangePasswordSuccessState extends ChangePasswordState {
  final String message;

  ChangePasswordSuccessState(this.message);
}
final class ChangePasswordErrorState extends ChangePasswordState {
  final String message;

  ChangePasswordErrorState(this.message);
}
