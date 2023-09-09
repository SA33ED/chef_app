sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateChefLoadingState extends UpdateProfileState {}

final class UpdateChefErroringState extends UpdateProfileState {}

final class UpdateChefSuccessState extends UpdateProfileState {}
final class ChangeImageUpdateProfile extends UpdateProfileState {}
