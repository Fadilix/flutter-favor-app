import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomLabel extends StatelessWidget {
  final String text;
  FontWeight? fontWeight;
  double? fontSize;

  CustomLabel({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize ?? 28,
          ),
        ),
      ],
    );
  }
}
