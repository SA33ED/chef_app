

import 'package:chef_app/features/menu/peresentation/screens/menu_home_screen.dart';
import 'package:chef_app/features/profile/peresentation/screens/profile_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens=[const MenuHomeScreen(),const ProfileHomeScreen()];
  int currenIndex = 0;
  void changeIndex(index){
    currenIndex=index;
    emit(CurrenIndexState());
  }
}
