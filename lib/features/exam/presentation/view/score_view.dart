import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/domain/entities/exam_entity.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'exam_view.dart';

class ScoreView extends StatelessWidget {
  final int score;
  final int total;
  final List<QuestionEntity> questions;

  const ScoreView(
      {super.key, required this.score, required this.total, required this.questions});

  @override
  Widget build(BuildContext context) {
    int incorrect = total - score;
    double percentage = (score / total) * 100;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Subjects_ExamScore.tr(),
        style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black,fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(LocaleKeys.Subjects_YourScore.tr(), style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              Row(
                children: [
                  CircularPercentIndicator(
                    backgroundColor: AppColors.red,
                    radius: 80.0,
                    lineWidth: 10.0,
                    percent: score / total,
                    center: Text("${percentage.toInt()}%",
                        style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                    progressColor: AppColors.blue,

                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(LocaleKeys.Subjects_Correct.tr(),
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.blue,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: AppColors.blue)
                                ),
                                child: Text("$score", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.blue,fontWeight: FontWeight.w600))
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(LocaleKeys.Subjects_Incorrect.tr(),
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.red,fontWeight: FontWeight.w600)),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: AppColors.red)
                                ),
                                child: Text("$incorrect", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.red,fontWeight: FontWeight.w600))
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(LocaleKeys.Subjects_ShowResults.tr(),)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          side: WidgetStatePropertyAll(BorderSide(color: AppColors.blue),),
                          backgroundColor:WidgetStatePropertyAll(AppColors.white)
                    
                      ),
                      onPressed: () =>
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => ExamView())),
                      child: Text(LocaleKeys.Subjects_StartAgain.tr(),
                      style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.blue,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}