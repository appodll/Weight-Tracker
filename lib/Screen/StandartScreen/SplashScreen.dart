import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weighttracker/Controller/Stroge.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  Future<void>initializedLock()async{
    var isLock = await HiveStroge.getHiveStroge(key: "fingerprint");
    if (isLock == true){
      Get.offAllNamed("/fingerprint");
    }else{
      Get.offAllNamed("/intro");
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){initializedLock();});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(backgroundColor: Colors.white,);
  }
}