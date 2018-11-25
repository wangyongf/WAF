import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String btnName;
  final double btnHeight;
  final MaterialColor btnBorderColor;
  final double circular;
  final double fontSize;

  BorderButton(this.btnName, this.btnHeight, this.btnBorderColor, this.fontSize,
      this.circular);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: btnHeight,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.all(Radius.circular(circular)),
      ),
      child: Text(
        btnName,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
