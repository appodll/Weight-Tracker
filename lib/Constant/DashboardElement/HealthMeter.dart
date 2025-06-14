import 'package:flutter/material.dart';
import 'package:weighttracker/Constant/StaticText.dart';
import 'package:weighttracker/Theme/ThemeService.dart';

class HealthMeter extends StatefulWidget {
  final double currentValue;

  HealthMeter({super.key, this.currentValue = 27.5});

  @override
  State<HealthMeter> createState() => _HealthMeterState();
}

class _HealthMeterState extends State<HealthMeter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getHealthStatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Healthy";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 33, 55, 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Statictext(
                    text: widget.currentValue.toStringAsFixed(1),
                    color: Colors.white,
                    size: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Statictext(
                      text: _getHealthStatus(widget.currentValue),
                      color: primarycolor2.value,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 12,
                        child: Row(children: _buildSegments()),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Statictext(
                            text: '15',
                            color: Colors.white.withOpacity(0.6),
                            size: 12,
                          ),
                          Statictext(
                            text: '27.5',
                            color: Colors.white.withOpacity(0.6),
                            size: 12,
                          ),
                          Statictext(
                            text: '40',
                            color: Colors.white.withOpacity(0.6),
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSegments() {
    List<Widget> segments = [];
    int totalSegments = 50;

    double normalized = ((widget.currentValue - 15) / (40 - 15)).clamp(
      0.0,
      1.0,
    );
    int activeSegments = (normalized * totalSegments * _animation.value)
        .round();

    for (int i = 0; i < totalSegments; i++) {
      Color segmentColor;

      if (i < activeSegments) {
        double ratio = i / totalSegments;
        segmentColor = Color.lerp(
          primarycolor2.value,
          Color(0xFFF44336),
          ratio.clamp(0.0, 1.0),
        )!;
      } else {
        segmentColor = Colors.white.withOpacity(0.1);
      }

      segments.add(
        Flexible(
          child: Container(
            height: 12,
            margin: EdgeInsets.only(right: 1),
            decoration: BoxDecoration(
              color: segmentColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      );
    }

    return segments;
  }
}
