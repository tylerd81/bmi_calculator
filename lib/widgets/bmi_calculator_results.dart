import "package:flutter/material.dart";
import "package:scoped_model/scoped_model.dart";
import "package:bmi_calculator/models/bmi_calculator_model.dart";

class BmiCalculatorResults extends StatelessWidget {
  Widget _buildDetailsWidget(double bmi) {
    List<String> results = [
      "A BMI below 18.5 is considered underweight",
      "A BMI between 18.5 and 24.9 is considered healthy",
      "A BMI Between 25.0 and 29.9 is considered overweight",
      "A BMI above 30.0 is considered obese",
    ];
    List<Color> colors = [
      Colors.yellow,
      Colors.green,
      Colors.orange,
      Colors.red
    ];
    int bmiIndex;

    if (bmi < 18.5) {
      bmiIndex = 0;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      bmiIndex = 1;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      bmiIndex = 2;
    } else {
      bmiIndex = 3;
    }

    return Text(
      results[bmiIndex],
      style: TextStyle(
        color: colors[bmiIndex],
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
      softWrap: true,
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: ScopedModelDescendant(builder:
          (BuildContext context, Widget child, BmiCalculatorModel model) {
        double currentBmi = model.bmi;
        return Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                        child: Text("Results", style: TextStyle(fontSize: 30))),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Center(
                        child: currentBmi == null
                            ? Text("Enter your height and weight above.",
                                style: TextStyle(fontSize: 19))
                            : Text("Calculated BMI: $currentBmi",
                                style: TextStyle(fontSize: 19)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Center(
                        child: currentBmi == null
                            ? Container()
                            : _buildDetailsWidget(currentBmi),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
