import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weighttracker/Constant/StaticText.dart';

class Buttonelement extends StatelessWidget {
  final void Function()? onPressed;
  final title;
  final backgroundColor;
  final width;
  final height;
  final type;
  final side;
  final text_color;
  final double font_size;
  final double padding;
  final font_weight;
  final Widget? child;
  final double radius;
  final shape;
  final keyy;
  final border_color;

  Buttonelement({
    required this.onPressed,
    required this.title,
    this.backgroundColor = const Color.fromRGBO(28, 254, 212, 1),
    this.width = 0.0,
    this.height = 55.0,
    this.type = 'elevated',
    this.side,
    this.text_color,
    this.font_size = 12.0,
    this.padding = 16.0,
    this.font_weight = FontWeight.w500,
    this.child,
    this.radius = 8,
    this.shape = 'rectangle',
    this.border_color,
    this.keyy,
  });

  @override
  Widget build(BuildContext context) {
    return type == 'elevated'
        ? ElevatedButton(
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Statictext(
                  keyy: keyy,
                  text: title,
                  size: font_size,
                  color: text_color,
                  fontWeight: font_weight,
                ),
                if (child != null) ...[child!],
              ],
            ),
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(
                Size(width == 0.0 ? Get.width - 50 : width, height),
              ),
              backgroundColor: WidgetStatePropertyAll(backgroundColor),
              shape: shape == "rectangle"
                  ? WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    )
                  : WidgetStatePropertyAll(CircleBorder()),
            ),
          )
        : type == 'outlined'
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
              side: side,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: border_color),
              ),
              backgroundColor: backgroundColor,
            ),
            child: Statictext(
              keyy: keyy,
              text: title,
              align: TextAlign.center,
              size: font_size,
              color: text_color,
              fontWeight: font_weight,
            ),
          )
        : type == "textbutton"
        ? TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Statictext(
                  keyy: keyy,
                  text: title,
                  size: font_size,
                  color: text_color,
                  fontWeight: FontWeight.w500,
                ),
                if (child != null) ...[child!],
              ],
            ),
          )
        : Container();
  }
}
