import 'package:calculator/CalculatorColors.dart';
import 'package:flutter/material.dart';

typedef OnButtonClick = void Function(String);

class Button extends StatelessWidget {
  String text;
  int flex;
  Color textColor;
  Color? backgroundColor;
  double fontSize;
  FontWeight fontWeight;
  Widget? child;
  bool isIcon;
  OnButtonClick onButtonClick;

  Button({
    required this.text,
    this.flex = 1,
    this.textColor = CalculatorColor.lightBlue,
    this.backgroundColor,
    this.fontSize = 32,
    this.fontWeight = FontWeight.w500,
    this.isIcon = false,
    required this.onButtonClick,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: FloatingActionButton(
          onPressed: () {
            onButtonClick(text);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          backgroundColor: backgroundColor ?? CalculatorColor.darkGrey,
          child: isIcon
              ? Icon(Icons.backspace_outlined, color: CalculatorColor.white)
              : Text(
                  text,
                  style: TextStyle(
                    fontWeight: fontWeight,
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
        ),
      ),
    );
  }
}
