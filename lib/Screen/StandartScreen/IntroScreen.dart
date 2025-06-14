import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:weighttracker/Constant/ButtonElement.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Controller/IntroController.dart';
import 'package:weighttracker/Controller/Stroge.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final Introcontroller intro_controller = Get.put(Introcontroller());

  @override
  void initState() {
    super.initState();
    intro_controller.auth = LocalAuthentication();
    intro_controller.auth.isDeviceSupported().then(
      (value) => setState(() {
        intro_controller.supportState = value;
      }),
    );
    if (intro_controller.supportState) {
      Get.offAllNamed("/dashboard");
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: primarycolor.value,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: primarycolor.value,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Buttonelement(
            onPressed: () {
              intro_controller.getAvaibleBiometrics();
            },
            title: "Continue",
            text_color: Colors.black,
            width: Get.width - 50,
            height: 50.0,
            font_size: 16,
            font_weight: FontWeight.w600,
            radius: 40,
          ),
          SizedBox(height: 15),
          Buttonelement(
            backgroundColor: primarycolor.value,

            onPressed: () {
              Get.offAllNamed("/dashboard");
            },
            title: "Not Now",
            text_color: primarycolor2.value,
            width: Get.width - 50,
            height: 50.0,
            font_size: 16,
            font_weight: FontWeight.w600,
            radius: 40,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    LucideIcons.fingerprint,
                    size: 140,
                    color: primarycolor2.value,
                  ),
                  SizedBox(height: 30),
                  Statictext(
                    text: "Enable Fingerprint",
                    color: Colors.white,
                    size: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10),
                  Statictext(
                    text:
                        "For your security, enable fingerprint authentication to protect your data.",
                    color: Color.fromRGBO(149, 150, 170, 1),
                    size: 17,
                    fontWeight: FontWeight.w500,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
