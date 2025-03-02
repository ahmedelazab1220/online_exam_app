import 'package:flutter/material.dart';
import 'package:online_exam_app/features/explore/presentation/view/widgets/start_exam_body.dart';

class StartExamView extends StatelessWidget {
  const StartExamView({super.key, required this.index, required this.title, required this.duration, required this.numOfQuestions, required this.image, required this.type});
  final int index;
  final String title;
  final String type;
  final String image;
  final int duration;
  final int numOfQuestions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StartExamBody(index: index, title: title, duration: duration, numOfQuestions: numOfQuestions, image: image, type: type,),
    );
  }
}
