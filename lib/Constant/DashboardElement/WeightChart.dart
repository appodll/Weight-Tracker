import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Controller/WeightController.dart';
import 'package:weighttracker/Func/helpers.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class WeightChart extends StatelessWidget {
  final Weightcontroller weightcontroller = Get.put(Weightcontroller());
  WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final allData = weightcontroller.all_weight_info;
      final int maxPoints = 30;
      final int startIndex = allData.length > maxPoints
          ? allData.length - maxPoints
          : 0;
      final displayData = allData.sublist(startIndex);

      return Container(
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    final index = touchedSpot.x.toInt();
                    if (index < 0 || index >= displayData.length) {
                      return null;
                    }

                    final weightData = displayData[index];
                    final date = weightData.dateTime!;
                    final formattedDate = formatDateToShort(date);
                    final weight = weightData.weight.toString();

                    return LineTooltipItem(
                      "$formattedDate\n$weight kg",
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    );
                  }).toList();
                },
              ),
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return spotIndexes.map((spotIndex) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      strokeWidth: 2,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          primarycolor2.value.withOpacity(0.6),
                          primarycolor2.value.withOpacity(0.4),
                          primarycolor2.value.withOpacity(0.3),
                          primarycolor2.value.withOpacity(0.2),
                          primarycolor2.value.withOpacity(0.15),
                          primarycolor2.value.withOpacity(0.1),
                          primarycolor2.value.withOpacity(0.0),
                        ],
                      ),
                    ),
                    FlDotData(
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                            radius: 6,
                            color: primarycolor2.value,
                            strokeWidth: 3,
                            strokeColor: Colors.white,
                          ),
                    ),
                  );
                }).toList();
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  maxIncluded: true,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index >= 0 && index < displayData.length) {
                      var monthName;
                      if (displayData[index].dateTime!.month ==
                          DateTime.now().month) {
                        monthName = getDayNameShort(
                          displayData[index].dateTime!,
                        );
                      } else {
                        monthName = getMonthNameShortEnglish(
                          displayData[index].dateTime!,
                        );
                      }
                      return Statictext(
                        text: monthName,
                        color: Color.fromRGBO(149, 150, 170, 1),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              rightTitles: AxisTitles(drawBelowEverything: false),

              topTitles: AxisTitles(drawBelowEverything: false),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  interval: 10,

                  getTitlesWidget: (value, meta) {
                    return Statictext(
                      text: "${value.toInt().toString()} kg",
                      color: Color.fromRGBO(149, 150, 170, 1),
                      size: 13,
                    );
                  },
                ),
              ),
            ),

            gridData: FlGridData(
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: false,
              horizontalInterval: 10,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.white.withOpacity(0.1),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(show: false),
            minY: 40,
            minX: 0,
            lineBarsData: [
              LineChartBarData(
                spots: displayData.length == 1
                    ? [
                        FlSpot(
                          0,
                          double.parse(displayData[0].weight.toString()),
                        ),
                        FlSpot(
                          1,
                          double.parse(displayData[0].weight.toString()),
                        ),
                      ]
                    : List.generate(displayData.length, (index) {
                        return FlSpot(
                          double.parse(index.toString()),
                          double.parse(displayData[index].weight.toString()),
                        );
                      }),
                isCurved: true,
                barWidth: 1.5,
                color: primarycolor2.value,

                dotData: FlDotData(
                  show: true,
                  getDotPainter: (p0, p1, p2, p3) {
                    return FlDotCirclePainter(
                      radius: 5,
                      color: primarycolor.value,
                      strokeWidth: 2,
                      strokeColor: primarycolor2.value,
                    );
                  },
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: primarycolor2.value.withOpacity(0.1),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,

                    colors: [
                      primarycolor2.value.withOpacity(0.6),
                      primarycolor2.value.withOpacity(0.4),
                      primarycolor2.value.withOpacity(0.3),
                      primarycolor2.value.withOpacity(0.2),
                      primarycolor2.value.withOpacity(0.1),
                      primarycolor2.value.withOpacity(0.05),
                      primarycolor2.value.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
