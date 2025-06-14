import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:weighttracker/Constant/StaticText.dart';

class WeightAddHeader extends StatelessWidget {
  const WeightAddHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Statictext(
          text: "New Weight",
          color: Colors.white,
          size: 25,
          fontWeight: FontWeight.w600,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Get.offNamed("/dashboard");
          },
          child: Icon(LucideIcons.x, color: Colors.white, size: 30),
        ),
      ],
    );
  }
}
