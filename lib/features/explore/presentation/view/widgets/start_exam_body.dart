import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

class StartExamBody extends StatelessWidget {
  const StartExamBody({
    super.key,
    required this.index,
    required this.title,
    required this.type,
    required this.duration,
    required this.numOfQuestions,
    required this.image,
  });

  final int index;
  final String title;
  final String type;
  final String image;
  final int duration;
  final int numOfQuestions;

  @override
  Widget build(BuildContext context) {

    List<String> instructions = [
      "Lorem ipsum dolor sit amet consectetur.",
      "Lorem ipsum dolor sit amet consectetur.",
      "Lorem ipsum dolor sit amet consectetur.",
      "Lorem ipsum dolor sit amet consectetur.",
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(image,height: 47,width: 42,),
                    SizedBox(width: 10,),
                    Text(
                      type,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text("$duration Minutes",
                        style: TextStyle(fontSize: 13,color: AppColors.blue,fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(title,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.black)),
                    SizedBox(width: 10),
                    Container(height: 20,color: AppColors.black[30],width: 2,),
                    SizedBox(width: 10),
                    Text("$numOfQuestions Question",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.gray)),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColors.black[50],thickness: .8,),
          SizedBox(height: 20),
          Text(
            "Instructions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: AppColors.black),
          ),
          SizedBox(height: 10),
          ...instructions.map((instruction) => Row(
            children: [
              Icon(Icons.circle, color: AppColors.gray,size: 6,),
              SizedBox(width: 8,),
              Text(instruction,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.gray),),
            ]
          )),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            child: Text(LocaleKeys.Subjects_Start.tr()),
          ),
        ],
      ),
    );
  }
}