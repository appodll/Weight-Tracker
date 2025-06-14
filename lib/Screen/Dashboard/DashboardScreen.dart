import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weighttracker/Constant/ButtonElement.dart';
import 'package:weighttracker/Constant/DashboardElement/HealthMeter.dart';
import 'package:weighttracker/Constant/DashboardElement/HistoryElements/AllHistoryElement.dart';
import 'package:weighttracker/Constant/DashboardElement/HistoryElements/HistoryElement.dart';
import 'package:weighttracker/Constant/DashboardElement/WeightChart.dart';
import 'package:weighttracker/Constant/DashboardElement/WeightRowText.dart';
import 'package:weighttracker/Constant/ElementHeader.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Controller/Stroge.dart';
import 'package:weighttracker/Controller/WeightController.dart';
import 'package:weighttracker/Func/helpers.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Weightcontroller weightcontroller = Get.put(Weightcontroller());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      weightcontroller.get_weight(key: "weight_info");
    });
    super.initState();
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
          onPressed: () {
            Get.toNamed("/weight_add");
            //HiveStroge.deleteHiveStroge(key: "weight_info");
          },
          title: "New Weight",
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
          child: weightcontroller.all_weight_info.isEmpty
              ? Center(
                  child: Statictext(
                    text: "Not found",
                    color: Color.fromRGBO(149, 150, 170, 1),
                    size: 20,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      WeightChart(),
                      SizedBox(height: 20),
                      WeightRowText(),
                      SizedBox(height: 40),
                      weightcontroller.all_weight_info.isEmpty
                          ? SizedBox.shrink()
                          : ElementHeader(title: "BMI Calculator"),
                      SizedBox(height: 15),
                      weightcontroller.all_weight_info.isEmpty
                          ? SizedBox.shrink()
                          : HealthMeter(
                              currentValue: calculateBMI(
                                double.parse(
                                  weightcontroller.all_weight_info.last.weight,
                                ),
                                double.parse(
                                  weightcontroller.all_weight_info.last.height,
                                ),
                              ),
                            ),
                      SizedBox(height: 40),
                      weightcontroller.all_weight_info.isEmpty
                          ? SizedBox.shrink()
                          : ElementHeader(title: "History"),
                      SizedBox(height: 15),
                      weightcontroller.all_weight_info.isEmpty
                          ? SizedBox.shrink()
                          : Allhistoryelement(),
                      SizedBox(height: 80,)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
