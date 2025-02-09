import 'package:flutter/material.dart';

AppBar buildAppBar(context,{required String title}){
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: (){
        Navigator.pop(context);
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
