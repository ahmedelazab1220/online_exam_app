import 'package:easy_localization/easy_localization.dart';
import 'package:online_exam_app/core/assets/app_images.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

class SurveyEntity {
  final String title;
  final String image;
  SurveyEntity(
      {
        required this.title,
        required this.image
      }
      );
}

List<SurveyEntity >  surveyList = [
  SurveyEntity(title: LocaleKeys.Home_Language.tr(), image:AppImages.languageImage) ,
  SurveyEntity(title: LocaleKeys.Home_Math.tr(), image:AppImages.mathImage) ,
  SurveyEntity(title: LocaleKeys.Home_Art.tr(), image:AppImages.artImage) ,
  SurveyEntity(title: LocaleKeys.Home_Science.tr(), image:AppImages.scienceImage) ,
];