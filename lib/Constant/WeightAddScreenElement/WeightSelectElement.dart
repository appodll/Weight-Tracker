import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_container_ns/responsive_container_ns.dart';
import 'package:tape_slider/tape_slider.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Controller/WeightController.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class Weightselectelement extends StatelessWidget {
  final Weightcontroller weight_controller = Get.put(Weightcontroller());
  Weightselectelement({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Statictext(
                text: weight_controller.initial_kg.value.toString(),
                color: Colors.white,
                size: 35,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 10),
                child: Statictext(
                  text: "kg",
                  color: Colors.white,
                  size: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ResponsiveContainer(
            heightPercent: 20,
            widthPercent: Get.width - 30,
            child: TapeSlider(
              onValueChanged: (p0) {
                weight_controller.initial_kg.value = p0;
              },
              initialValue: weight_controller.initial_kg.value,
              minValue: 40.0,
              maxValue: 150.0,
              itemExtent: 20.0,
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              indicatorColor: primarycolor2.value,
              majorTickLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              trackHeight: 150,
              showLabels: true,
              minorTickLabelStyle: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
