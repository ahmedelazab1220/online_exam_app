import 'package:flutter/material.dart';
import 'package:online_exam_app/features/explore/presentation/view/widgets/explore_details_body.dart';

class ExploreDetailsView extends StatelessWidget {
  const ExploreDetailsView({super.key, required this.index, required this.title});
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ExploreDetailsBody(title: title,),
    );
  }
}
