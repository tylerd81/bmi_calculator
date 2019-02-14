import "package:flutter/material.dart";
import "package:scoped_model/scoped_model.dart";

import "package:bmi_calculator/models/bmi_calculator_model.dart";
import "./pages/bmi_app_home_page.dart";

void main() => runApp(BmiApp());

class BmiApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModel<BmiCalculatorModel>(
      model: BmiCalculatorModel(),
      child: MaterialApp(
        title: "BMI calculator",
        home: BmiAppHomePage(),
      ),
    );
  }
}