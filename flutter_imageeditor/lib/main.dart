import 'package:flutter/material.dart';
import 'package:flutter_chatgpt/Screens/homescren.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Homescreen(),
    );
  }
}
 // RxDouble slidervalue = 0.5.obs;
  // void updateslidervalue(double newvalue) {
  //   slidervalue.value = newvalue;
  // }