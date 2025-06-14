import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighttracker/Controller/Stroge.dart';
import 'package:weighttracker/Theme/Routes.dart';

void main()async{
  await HiveStroge.strogeInitialize();
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Weight Tracker",
      getPages: Routes,
      initialRoute: "/",
    );
  }
}