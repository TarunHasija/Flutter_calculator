import 'package:flutter/material.dart';
import 'package:calculator/colors.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/button.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Calculator(),
    ),
  );
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //variables

  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var heightInput = false;
  var outputSize = 34.0;
  onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        heightInput = true;
        outputSize = 50;
      }
    } else {
      input = input + value;
      heightInput = false;
      outputSize = 34;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding:  const EdgeInsets.all(12),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    heightInput ?" ": input,
                    style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        fontSize: outputSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Buttonn(
                text: 'AC',
                btncolor: operatorColor,
                tcolor: orangeColor,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '<',
                btncolor: operatorColor,
                tcolor: orangeColor,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '',
                btncolor: Colors.transparent,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '/',
                btncolor: operatorColor,
                tcolor: orangeColor,
                onPressed: onButtonClick,
              ),
            ],
          ),
          Row(
            children: [
              Buttonn(
                text: '7',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '8',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '9',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: 'x',
                btncolor: operatorColor,
                tcolor: orangeColor,
                onPressed: onButtonClick,
              ),
            ],
          ),
          Row(
            children: [
              Buttonn(
                text: '4',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '5',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '6',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '-',
                btncolor: operatorColor,
                tcolor: orangeColor,
                onPressed: onButtonClick,
              ),
            ],
          ),
          Row(
            children: [
              Buttonn(
                text: '1',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '2',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '3',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '+',
                btncolor: operatorColor,
                tcolor: orangeColor,
                onPressed: onButtonClick,
              ),
            ],
          ),
          Row(
            children: [
              Buttonn(
                text: '%',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '0',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '.',
                btncolor: buttonColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
              Buttonn(
                text: '=',
                btncolor: orangeColor,
                tcolor: Colors.white,
                onPressed: onButtonClick,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
