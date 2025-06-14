import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Controller/WeightController.dart';
import 'package:weighttracker/Func/helpers.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class WeightRowText extends StatefulWidget {
  WeightRowText({super.key});

  @override
  State<WeightRowText> createState() => _WeightSliderTextState();
}

class _WeightSliderTextState extends State<WeightRowText> {
  final Weightcontroller weightcontroller = Get.put(Weightcontroller());

  @override
  Widget build(BuildContext context) {
    List allWeights = weightcontroller.all_weight_info;
    List lastThree = allWeights.length >= 3
        ? allWeights.sublist(allWeights.length - 3)
        : allWeights;
    return Obx(
      () => allWeights.isEmpty
          ? Container()
          : Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(lastThree.length, (index) {
                      final bool isCenter = index == lastThree.length - 1;
                      return isCenter
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Statictext(
                                  text: lastThree[index].weight,
                                  color: Colors.white,
                                  size: 55,
                                  fontWeight: FontWeight.w600,
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(bottom: 10),
                                  child: Statictext(
                                    text: "kg",
                                    color: Colors.white,
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Statictext(
                                      text: lastThree[index].weight,
                                      color: Color.fromRGBO(149, 150, 170, 1),
                                      size: 35,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        bottom: 10,
                                      ),
                                      child: Statictext(
                                        text: "kg",
                                        color: Color.fromRGBO(149, 150, 170, 1),
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Statictext(
                                  text: formatDateToShort(
                                    lastThree[index].dateTime,
                                  ),
                                  color: Color.fromRGBO(149, 150, 170, 1),
                                  size: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            );
                    }),
                  ),
                  SizedBox(height: 10),
                  weightcontroller.all_weight_info.isEmpty
                      ? Container()
                      : LinearProgressIndicator(
                          value:
                              double.parse(
                                weightcontroller
                                    .all_weight_info[weightcontroller
                                            .all_weight_info
                                            .length -
                                        1]
                                    .weight,
                              ) /
                              double.parse(
                                weightcontroller.all_weight_info[0].weight,
                              ),
                          backgroundColor: Color.fromRGBO(104, 104, 118, 1),
                          color: primarycolor2.value,
                          borderRadius: BorderRadius.circular(15),
                          minHeight: 3,
                        ),
                ],
              ),
            ),
    );
  }
}
