import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tape_slider/tape_slider.dart';
import 'package:weighttracker/Constant/ButtonElement.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Constant/WeightAddScreenElement/CalendarElement.dart';
import 'package:weighttracker/Constant/WeightAddScreenElement/ScreenHeader.dart';
import 'package:weighttracker/Controller/Stroge.dart';
import 'package:weighttracker/Controller/WeightController.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class WeightaddScreen extends StatefulWidget {
  WeightaddScreen({super.key});

  @override
  State<WeightaddScreen> createState() => _WeightaddScreenState();
}

class _WeightaddScreenState extends State<WeightaddScreen> {
  final Weightcontroller weight_controller = Get.put(Weightcontroller());

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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: primarycolor2.value.withOpacity(0.4),
              blurRadius: 30,
            ),
          ],
        ),
        child: Buttonelement(
          onPressed: () async {
            String? selectedHeight;

            await showDialog(
              context: context,
              builder: (BuildContext context) {
                String tempHeight = "170";

                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      backgroundColor: primarycolor.value,
                      title: Statictext(
                        text: "Select height",
                        color: Colors.white,
                      ),
                      content: DropdownButton<double>(
                        dropdownColor: primarycolor.value,
                        value: double.parse(tempHeight.toString()),
                        items: List.generate(61, (index) {
                          double height = 140 + index.toDouble();
                          return DropdownMenuItem(
                            value: height,
                            child: Statictext(
                              text: "${height.toInt()} cm",
                              color: Colors.white,
                            ),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            tempHeight = value.toString();
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedHeight = tempHeight;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Statictext(
                            text: "Accept",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );

            if (selectedHeight != null && selectedHeight!.isNotEmpty) {
              weight_controller.save_weight(
                height: selectedHeight!,
                weight: weight_controller.initial_kg.value.toString(),
              );

              // weight_controller.get_weight(key: "weight_info");
            }
          },
          title: "Save",
          text_color: Colors.black,
          width: 180.0,
          height: 47.0,
          font_size: 16,
          font_weight: FontWeight.w600,
          radius: 40,
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(15),
            child: Column(
              children: [
                WeightAddHeader(),
                SizedBox(height: 40),
                Calendarelement(),
                SizedBox(height: 20),
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
                TapeSlider(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
