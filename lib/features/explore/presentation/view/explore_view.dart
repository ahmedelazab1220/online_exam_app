import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/features/explore/presentation/view/widgets/explore_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Home_Survey.tr(),style: TextStyle(color: AppColors.blue,fontWeight: FontWeight.w500,fontSize: 20),),
      ),
      body: ExploreBody(),
    );
  }
}
