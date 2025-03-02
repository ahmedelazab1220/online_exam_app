import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/domain/entities/survey_entity.dart';
import 'package:online_exam_app/features/explore/presentation/view/widgets/item_list.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        children: [
          SearchBar(
            leading: Icon(Icons.search,color: AppColors.black[30],),
            hintText: LocaleKeys.Home_Search.tr(),
            shadowColor: WidgetStateColor.transparent,
            hintStyle: WidgetStatePropertyAll(TextStyle(color: AppColors.black[30])),
            backgroundColor: WidgetStatePropertyAll(AppColors.white),
            side: WidgetStatePropertyAll(BorderSide(color: Color(0xff878787))),
          ),
          SizedBox(height: 30,),
          Text(LocaleKeys.Home_BrowseBySubject.tr(),style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.black
          ),),
          SizedBox(height: 30,),
          ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemList(index: index,);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20,);
              }, itemCount: surveyList.length)
        ],
      ),
    );
  }
}
