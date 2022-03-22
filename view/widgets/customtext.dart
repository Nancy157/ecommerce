
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontweight;

  CustomText(
      {this.text = '',
      this.fontsize = 16,
      this.color = Colors.black,
      this.alignment=Alignment.topLeft,
        this.fontweight=FontWeight.normal,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontsize,
          color: color,
        ),
      ),
    );
  }
}
