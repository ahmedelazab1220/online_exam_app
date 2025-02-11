import 'package:flutter/material.dart';
import 'package:online_exam_app/core/navigation/navigation_manager.dart';

AppBar buildAppBar(context,{required String title}){
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: (){
        NavigationManager.goBack();
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
