import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighttracker/Constant/DashboardElement/HistoryElements/HistoryElement.dart';
import 'package:weighttracker/Controller/WeightController.dart';

class Allhistoryelement extends StatelessWidget {
  final Weightcontroller weightcontroller = Get.put(Weightcontroller());
  Allhistoryelement({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: weightcontroller.all_weight_info.length * 125,
        child: ListView.builder(
          reverse: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: weightcontroller.all_weight_info.length,
          itemBuilder: (context, index) {
            var previousWeight = index == 0
                ? double.parse(weightcontroller.all_weight_info[index].weight)
                : double.parse(
                    weightcontroller.all_weight_info[index - 1].weight,
                  );

            double changeWeight =
                double.parse(weightcontroller.all_weight_info[index].weight) -
                previousWeight;

            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: HistoryElement(
                weight: weightcontroller.all_weight_info[index].weight,
                height: weightcontroller.all_weight_info[index].height,
                changed_weight: changeWeight,
                createdAt: weightcontroller.all_weight_info[index].dateTime,
              ),
            );
          },
        ),
      ),
    );
  }
}
