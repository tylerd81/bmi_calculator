import "package:flutter/material.dart";
import "package:scoped_model/scoped_model.dart";

import "package:bmi_calculator/models/bmi_calculator_model.dart";

class BmiCalculatorForm extends StatefulWidget {
  BmiCalculatorFormState createState() => BmiCalculatorFormState();
}

class BmiCalculatorFormState extends State<BmiCalculatorForm> {
  GlobalKey<FormState> _gKey = GlobalKey();
  double height = 0;
  double weight = 0;

  double calculateBmi(double height, double weight) {
    return (weight / (height * height)) * 703;
  }

  void _calculateBmiButtonPressed(BmiCalculatorModel model) {
    if (_gKey.currentState.validate()) {
      height = weight = 0;
      _gKey.currentState.save();
      model.bmi = calculateBmi(height, weight);
    }
  }

  String _validateFields(String value) {
    double v = double.tryParse(value);
    if (v == null) {
      return "Please use only numeric values";
    }
    return null;
  }

  void _saveHeightFeet(String value) {
    height += double.parse(value) * 12;
  }

  void _saveHeightInches(String value) {
    height += double.parse(value);
  }

  void _saveWeight(String value) {
    weight = double.parse(value);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle ts = TextStyle(color: Colors.white);

    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      child: ScopedModelDescendant(
        builder:
            (BuildContext context, Widget child, BmiCalculatorModel model) {
          return Form(
            key: _gKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(labelText: "Height (ft)", labelStyle: ts),
                  validator: _validateFields,
                  onSaved: _saveHeightFeet,
                  keyboardType: TextInputType.number,
                  style: ts,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Height (Inches)", labelStyle: ts),
                  validator: _validateFields,
                  onSaved: _saveHeightInches,
                  keyboardType: TextInputType.number,
                  style: ts,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Weight (lbs)",
                    labelStyle: ts,
                  ),
                  validator: _validateFields,
                  onSaved: _saveWeight,
                  keyboardType: TextInputType.number,
                  style: ts,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      child: Text("Calculate BMI"),
                      onPressed: () {
                        _calculateBmiButtonPressed(model);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
