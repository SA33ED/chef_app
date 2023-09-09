// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// import '../../../data/reposatiry/logout_repo.dart';

// part 'logout_state.dart';

// class LogoutCubit extends Cubit<LogoutState> {
//   LogoutCubit(this.logoutRepo) : super(LogoutInitial());
//   final ProfileRepository logoutRepo;

//   void logoutChef() async {
//     emit(LogoutChefLoadingState());
//     final result = await logoutRepo.logoutChef();
//     result.fold((l) => emit(LogoutChefErrorState()),
//         (r) => emit(LogoutChefSuccessState()));
//   }
// }
