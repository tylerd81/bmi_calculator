import "package:flutter/material.dart";
import "package:bmi_calculator/widgets/bmi_calculator_form.dart";
import "package:bmi_calculator/widgets/bmi_calculator_results.dart";

class BmiAppHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: BmiCalculatorForm()),
          Expanded(flex: 1, child: BmiCalculatorResults()),
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
