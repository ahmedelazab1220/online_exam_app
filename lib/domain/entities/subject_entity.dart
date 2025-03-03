import 'package:easy_localization/easy_localization.dart';
import 'package:online_exam_app/core/assets/app_images.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

class SubjectEntity {
  final String title;
  final String image;
  SubjectEntity(
      {
        required this.title,
        required this.image
      }
      );
}

List<SubjectEntity >  subjectList = [
  SubjectEntity(title: LocaleKeys.Home_Language.tr(), image:AppImages.languageImage) ,
  SubjectEntity(title: LocaleKeys.Home_Math.tr(), image:AppImages.mathImage) ,
  SubjectEntity(title: LocaleKeys.Home_Art.tr(), image:AppImages.artImage) ,
  SubjectEntity(title: LocaleKeys.Home_Science.tr(), image:AppImages.scienceImage) ,
];