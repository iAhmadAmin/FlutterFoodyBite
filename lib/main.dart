import 'package:flutter/material.dart';
import 'package:foodybite/view/pages/Root/root_page.dart';
import 'package:get/get.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
      ),
      home: RootPage()
    );
  }
}