import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/domain/entities/explore_details_entity.dart';
import 'package:online_exam_app/features/explore/presentation/view/start_exam_view.dart';

class ExploreDetailsBody extends StatelessWidget {
  const ExploreDetailsBody({super.key, required this.title});
  final String title;
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
                style:  Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StartExamView(index: index, title: item.title, duration: item.duration, numOfQuestions: item.numOfQuestion, image: item.image, type: title,),));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.image,
                            width: 60,
                            height: 71,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.title,
                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "${item.duration} Minutes",
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${item.numOfQuestion} Question",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.gray,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "From: ${item.fromTime}  To: ${item.toTime}",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
