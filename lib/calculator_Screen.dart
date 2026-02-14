import 'package:calculator/CalculatorColors.dart';
import 'package:flutter/material.dart';

import 'Button.dart';

class CalculatorScreen extends StatefulWidget {
  String text = '';
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resText = '';
  String operator = '';
  String lhs = '';
  String full = '';
  void onDigitClick(String text) {
    if (lhs == 'Infinity') {
      onClearClick('AC');
    }
    resText += text;
    setState(() {});
  }

  void onOperatorClick(String text) {
    if (lhs == 'Infinity') {
      onClearClick('AC');
    } else if (operator.isEmpty && resText.isEmpty && lhs.isEmpty) {
      return;
    } else if (operator.isEmpty) {
      operator = text;
      lhs = resText;
      full = lhs + operator;
      resText = '';
    } else if (resText.isEmpty) {
      operator = text;
      full = full.substring(0, full.length - 1) + operator;
    } else {
      if (operator != '=') {
        lhs = calculate(lhs, operator, resText);
      }
      operator = text;
      full = lhs + operator;
      resText = '';
    }
    setState(() {});
  }

  void onEqualClick(String text) {
    if (operator.isEmpty && resText.isEmpty && lhs.isEmpty) {
      return;
    }
    lhs = calculate(lhs, operator, resText);
    operator = text;
    full = full + resText + operator + lhs;
    resText = lhs;
    setState(() {});
  }

  void onClearClick(String text) {
    full = '';
    lhs = '';
    operator = '';
    resText = '';
    setState(() {});
  }

  void onBackSpaceClick(String text) {
    resText = resText.substring(0, resText.length - 1);

    setState(() {});
  }

  void onDotClick(String text) {
    if (resText.contains('.')) {
      return;
    } else {
      resText += text;
      setState(() {});
    }
  }

  String calculate(String lhs, String operator, String resText) {
    switch (operator) {
      case '+':
        return (double.parse(lhs) + double.parse(resText)).toString();
      case '*':
        return (double.parse(lhs) * double.parse(resText)).toString();
      case '-':
        return (double.parse(lhs) - double.parse(resText)).toString();
      case '/':
        return (double.parse(lhs) / double.parse(resText)).toString();
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      full,
                      style: TextStyle(
                        color: CalculatorColor.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      resText,
                      style: TextStyle(
                        color: CalculatorColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 48,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Button(
                                  text: 'Ac',
                                  textColor: CalculatorColor.white,
                                  backgroundColor: CalculatorColor.lightGrey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  onButtonClick: onClearClick,
                                ),
                                Button(
                                  text: 'back',
                                  isIcon: true,
                                  textColor: CalculatorColor.white,
                                  backgroundColor: CalculatorColor.lightGrey,
                                  onButtonClick: onBackSpaceClick,
                                ),
                                Button(
                                  text: '/',
                                  textColor: CalculatorColor.white,
                                  backgroundColor: CalculatorColor.darkBlue,
                                  onButtonClick: onOperatorClick,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Button(text: '7', onButtonClick: onDigitClick),
                                Button(text: '8', onButtonClick: onDigitClick),
                                Button(text: '9', onButtonClick: onDigitClick),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Button(text: '4', onButtonClick: onDigitClick),
                                Button(text: '5', onButtonClick: onDigitClick),
                                Button(text: '6', onButtonClick: onDigitClick),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Button(text: '1', onButtonClick: onDigitClick),
                                Button(text: '2', onButtonClick: onDigitClick),
                                Button(text: '3', onButtonClick: onDigitClick),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Button(
                                  text: '0',
                                  flex: 2,
                                  onButtonClick: onDigitClick,
                                ),
                                Button(text: '.', onButtonClick: onDotClick),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Button(
                            text: '*',
                            flex: 2,
                            textColor: CalculatorColor.white,
                            backgroundColor: CalculatorColor.darkBlue,
                            onButtonClick: onOperatorClick,
                          ),
                          Button(
                            text: '-',
                            flex: 2,
                            textColor: CalculatorColor.white,
                            backgroundColor: CalculatorColor.darkBlue,
                            onButtonClick: onOperatorClick,
                          ),
                          Button(
                            text: '+',
                            flex: 3,
                            textColor: CalculatorColor.white,
                            backgroundColor: CalculatorColor.darkBlue,
                            onButtonClick: onOperatorClick,
                          ),
                          Button(
                            text: '=',
                            flex: 3,
                            textColor: CalculatorColor.white,
                            backgroundColor: CalculatorColor.lightBlue,
                            onButtonClick: onEqualClick,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
