import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/subject_entity.dart';
import 'package:online_exam_app/features/explore/presentation/view/explore_details_view.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreDetailsView(index: index, title: subjectList[index].title,),));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Row(
          children: [
            Image.asset(subjectList[index].image,height: 48,width: 48,),
            SizedBox(width: 10,),
            Text(subjectList[index].title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black)
            )
          ],
        ),
      ),
    );
  }
}
