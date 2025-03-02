import 'package:online_exam_app/core/assets/app_images.dart';

class ExploreDetailsEntity {
  final String type;
  final String title;
  final String image;
  final int duration;
  final int numOfQuestion;
  final String fromTime;
  final String toTime;
  ExploreDetailsEntity(
      {
        required this.type,
        required this.title,
        required this.image,
        required this.duration,
        required this.numOfQuestion,
        required this.fromTime,
        required this.toTime,
      }
      );
}

List<ExploreDetailsEntity >  exploreDetailsList = [
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "English",
      duration: 30,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "English",
      duration: 50,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "Spanish",
      duration: 80,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "Spanish",
      duration: 30,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "Spanish",
      duration: 30,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "English",
      duration: 30,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),
  ExploreDetailsEntity(
      title: "High level",
      image:AppImages.quizImage,
      type: "Arabic",
      duration: 30,
      numOfQuestion: 20,
      fromTime: "1.00",
      toTime: "6.00"),

];