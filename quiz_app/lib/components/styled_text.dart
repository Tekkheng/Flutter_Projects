import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.txt,
    required this.fsize,
    required this.color,
    required this.fweight,
    required this.txtAlign,
  });

  final String txt,fweight,txtAlign;
  final Color color;
  final double fsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          color: color,
          fontSize: fsize,
          fontWeight: fweight == 'bold' ? FontWeight.bold : FontWeight.normal),
      textAlign: txtAlign == 'center' ? TextAlign.center : TextAlign.start,
    );
  }
}
