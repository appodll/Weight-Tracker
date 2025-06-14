import 'package:flutter/material.dart';
import 'package:weighttracker/Constant/StaticText.dart';

class ElementHeader extends StatelessWidget {
  final title;
  const ElementHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Row(
        children: [
          Statictext(
            text: title.toString(),
            color: Color.fromRGBO(149, 150, 170, 1),
            fontWeight: FontWeight.w500,
            size: 23,
          ),
          
        ],
      ),
    );
  }
}
