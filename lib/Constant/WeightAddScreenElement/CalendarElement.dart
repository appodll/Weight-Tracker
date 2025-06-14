import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_container_ns/responsive_container_ns.dart';
import 'package:weighttracker/Controller/WeightController.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class Calendarelement extends StatelessWidget {
  final Weightcontroller weightcontroller = Get.put(Weightcontroller());
  Calendarelement({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ResponsiveContainer(
        heightPercent: 40,
        widthPercent: Get.width - 30,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(32, 33, 55, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primarycolor2.value,
                onPrimary: Colors.black,
                background: Color.fromRGBO(32, 33, 55, 1),
                surface: Colors.grey[200]!,
                onSurface: Color.fromRGBO(182, 184, 217, 1),
              ),
              textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
            ),
            child: Material(
              color: Colors.transparent,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (date) {
                  weightcontroller.date_picker.value = date;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
