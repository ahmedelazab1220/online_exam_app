import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/assets/app_icons.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/features/bottom_navigation_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:online_exam_app/features/bottom_navigation_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_state.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<BottomNavigationBarCubit>(context);
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: cubit.bottomNavIndex,
              onDestinationSelected: (currentIndex) {
                debugPrint("Current index is : $currentIndex");
                cubit.changeBottomNavIndex(currentIndex: currentIndex);
              },
              destinations: [
                NavigationDestination(
                  icon: cubit.bottomNavIndex == 0 ?SvgPicture.asset(AppIcons.exploreIcon):SvgPicture.asset(AppIcons.unSelectedExploreIcon),
                  label: LocaleKeys.Home_Explore.tr(),
                ),
                NavigationDestination(
                  icon: cubit.bottomNavIndex == 1 ?SvgPicture.asset(AppIcons.resultIcon):SvgPicture.asset(AppIcons.unSelectedResultIcon),
                  label: LocaleKeys.Result_Result.tr(),
                ),
                NavigationDestination(
                  icon: cubit.bottomNavIndex == 2 ?SvgPicture.asset(AppIcons.profileIcon):SvgPicture.asset(AppIcons.unSelectedProfileIcon),
                  label: LocaleKeys.Profile_Profile.tr(),
                ),
              ],
            ),
            body: cubit.screens[cubit.bottomNavIndex],
          );
        },
      ),
    );
  }
}