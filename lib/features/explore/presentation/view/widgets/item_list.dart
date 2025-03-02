import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/survey_entity.dart';
import 'package:online_exam_app/features/explore/presentation/view/explore_details_view.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetailsView(index: index, title: surveyList[index].title,),));
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: .2,
              offset: Offset(1, 1), // X, Y offset
            ),
          ],
        ),

        child: Row(
          children: [
            Image.asset(surveyList[index].image,height: 48,width: 48,),
            Text(surveyList[index].title,style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16
            ),)
          ],
        ),
      ),
    );
  }
}
