import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/assets/app_icons.dart';
import 'package:online_exam_app/features/bottom_navigation_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:online_exam_app/features/bottom_navigation_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_state.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavigationBarCubit>(context);
    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold);
                  }
                  return TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold);
                },
              ),
            ),
            child: NavigationBar(
              height: 70,
              elevation: 0,
              selectedIndex: cubit.bottomNavIndex,
              indicatorColor: Color(0xffCCD7EB),
              onDestinationSelected: (currentIndex) {
                debugPrint("Current index is : $currentIndex");
                cubit.changeBottomNavIndex(currentIndex: currentIndex);
              },
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: AppColors.lightBlue,
              destinations: [
                NavigationDestination(
                  icon: cubit.bottomNavIndex == 0 ?SvgPicture.asset(AppIcons.exploreIcon):SvgPicture.asset(AppIcons.unSelectedExploreIcon),
                  label: "Explore",
                ),
                NavigationDestination(
                  icon: cubit.bottomNavIndex == 1 ?SvgPicture.asset(AppIcons.resultIcon):SvgPicture.asset(AppIcons.unSelectedResultIcon),
                  label: "Result",
                ),
                NavigationDestination(
                  icon: cubit.bottomNavIndex == 2 ?SvgPicture.asset(AppIcons.profileIcon):SvgPicture.asset(AppIcons.unSelectedProfileIcon),
                  label: "Profile",
                ),
              ],
            ),
          ),
          body: cubit.screens[cubit.bottomNavIndex],
        );
      },
    );
  }
}