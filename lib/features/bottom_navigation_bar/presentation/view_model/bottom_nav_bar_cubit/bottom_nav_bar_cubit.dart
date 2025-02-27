import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/bottom_navigation_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_state.dart';
import 'package:online_exam_app/features/explore/presentation/view/explore_view.dart';
import 'package:online_exam_app/features/profile/presentation/view/profile_view.dart';
import 'package:online_exam_app/features/result/presentation/view/result_view.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitialState());

  int bottomNavIndex = 0;

  void changeBottomNavIndex({required int currentIndex}) {
    bottomNavIndex = currentIndex;
    emit(ChangeBottomNavigationIndexState());
  }

  List<Widget> screens = [
    ExploreView(),
    ResultView(),
    ProfileView()
  ];
}