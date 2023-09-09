import 'package:chef_app/features/profile/peresentation/cubit/get_chef_data_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/get_data_profile_model.dart';
import '../../../data/reposatiry/logout_repo.dart';
import '../../../data/reposatiry/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getProfileRepo, this.logoutRepo) : super(ProfileInitial());
  final ProfileRepository getProfileRepo;

  GetDataChefModel? getChefModel;
  void getChefData() async {
    emit(GetChefDataLoadingState());
    final result = await getProfileRepo.getChefData();
    result.fold((l) => emit(GetChefDataErrorState()),
        (r) {
          getChefModel=r;
          emit(GetChefDataSuccessState());
        });
  }
  //!logout
  final LogoutRepository logoutRepo;

  void logoutChef() async {
    emit(LogoutChefLoadingState());
    final result = await logoutRepo.logoutChef();
    result.fold((l) => emit(LogoutChefErrorState()),
        (r) => emit(LogoutChefSuccessState()));
  }

}
