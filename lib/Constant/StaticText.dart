import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Statictext extends StatelessWidget {
  final text;
  final keyy;
  final double? size;
  final fontWeight;
  final color;
  final align;
  final overflow;
  final font_type;
  final maxlines;
  final underline;
  final underline_color;
  final double letterspacing;
  final gradient_color;

  Statictext(
      {required this.text,
      this.size,
      this.fontWeight,
      this.color = Colors.black,
      this.align = TextAlign.start,
      this.overflow = TextOverflow.visible,
      this.letterspacing = 0,
      this.font_type = 'poppins',
      this.underline,
      this.maxlines,
      this.underline_color,
      this.gradient_color,
      this.keyy});

  @override
  Widget build(BuildContext context) {
    return GradientText(
        colors: gradient_color == null
            ? [color,color]
            : gradient_color,
        text,
        style: font_type == 'poppins'
            ? GoogleFonts.poppins(
                fontSize: size,
                fontWeight: fontWeight,
                color: color,
                letterSpacing: letterspacing,
                decoration: underline == true
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: underline_color)
            : font_type == 'notoSans'
                ? GoogleFonts.notoSans(
                    fontSize: size,
                    fontWeight: fontWeight,
                    color: color,
                    letterSpacing: letterspacing,
                    decoration: underline == true
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: underline_color)
                : font_type == 'inter'
                    ? GoogleFonts.inter(
                        fontSize: size,
                        fontWeight: fontWeight,
                        color: color,
                        letterSpacing: letterspacing,
                        decoration: underline == true
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: underline_color)
                    : font_type == 'opensans'
                        ? GoogleFonts.openSans(
                            fontStyle: FontStyle.italic,
                            fontSize: size,
                            fontWeight: fontWeight,
                            color: color,
                            letterSpacing: letterspacing,
                            decoration: underline == true
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: underline_color)
                        : GoogleFonts.lato(
                            fontSize: size,
                            fontWeight: fontWeight,
                            color: color,
                            letterSpacing: letterspacing,
                            decoration: underline == true
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: underline_color),
        textAlign: align,
        overflow: overflow,
        maxLines: maxlines);
  }
}