import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Controller/IntroController.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class FingerprintScreen extends StatefulWidget {
  FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      intro_controller.getAvaibleBiometrics();
                    },
                    icon: Icon(
                      LucideIcons.fingerprint,
                      size: 140,
                      color: primarycolor2.value,
                    ),
                  ),
                  SizedBox(height: 30),
                  Statictext(
                    text: "Authenticate using your fingerprint to continue.",
                    color: Colors.white,
                    size: 18,
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
