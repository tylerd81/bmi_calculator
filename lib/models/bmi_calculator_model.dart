import "package:scoped_model/scoped_model.dart";

class BmiCalculatorModel extends Model {
  double _bmi;

  double get bmi {
    if(_bmi != null) {
      return double.parse(_bmi.toStringAsFixed(2));
    } else {
      return null;
    }

  }

  set bmi(double b) {
    _bmi = b;
    notifyListeners();
  }
}