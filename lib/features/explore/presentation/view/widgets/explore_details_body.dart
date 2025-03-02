import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/explore_details_entity.dart';
import 'package:online_exam_app/features/explore/presentation/view/start_exam_view.dart';

class ExploreDetailsBody extends StatelessWidget {
  const ExploreDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final groupedData = groupBy(exploreDetailsList, (ExploreDetailsEntity e) => e.type);

    return ListView(
      children: groupedData.entries.map((entry) {
        String type = entry.key;
        List<ExploreDetailsEntity> items = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                type,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StartExamView(index: index, title: item.title, duration: item.duration, numOfQuestions: item.numOfQuestion, image: item.image,),));
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                      tileColor: AppColors.white,
                      leading: Image.asset(
                        item.image,
                        width: 60,
                        height: 71,
                        fit: BoxFit.cover,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.black),),
                          Text("${item.duration} Minutes",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.blue)),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${item.numOfQuestion} Question",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColors.gray)),
                          SizedBox(height: 10,),
                          Text("From: ${item.fromTime}  To: ${item.toTime}",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColors.black)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }).toList(),
    );
  }
}
