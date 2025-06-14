import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Func/helpers.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class HistoryElement extends StatelessWidget {
  final weight;
  final height;
  final changed_weight;
  final createdAt;
  HistoryElement({
    super.key,
    this.weight,
    this.height,
    this.changed_weight,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 33, 55, 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Statictext(
                    text: formatDateToShort(createdAt),
                    color: Color.fromRGBO(149, 150, 170, 1),
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 5),
                  changed_weight.toString() == "0.0"
                      ? SizedBox.shrink()
                      : Row(
                          children: [
                            changed_weight.toString().substring(0, 1) == "-"
                                ? Icon(
                                    LucideIcons.arrowDown,
                                    color: primarycolor2.value,
                                  )
                                : Icon(
                                    LucideIcons.arrowUp,
                                    color: Color.fromRGBO(191, 87, 106, 1),
                                  ),
                            SizedBox(width: 3),
                            Statictext(
                              text:
                                  "${changed_weight.toString().substring(0, 1) == "-" ? changed_weight.toString().substring(1) : changed_weight.toString()} kg",
                              color:
                                  changed_weight.toString().substring(0, 1) ==
                                      "-"
                                  ? primarycolor2.value
                                  : Color.fromRGBO(191, 87, 106, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Statictext(
                        text: weight.toString(),
                        color: Colors.white,
                        size: 33,
                        fontWeight: FontWeight.w600,
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(bottom: 10),
                        child: Statictext(
                          text: "kg",
                          color: Colors.white,
                          size: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Statictext(
                    text: "${height} cm",
                    color: Colors.white,
                    size: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
