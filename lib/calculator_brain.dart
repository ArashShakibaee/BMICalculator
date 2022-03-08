import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain(this.height, this.weight);
  double bmi = 1;
  String bmiCalcolate() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'OverWeight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underWeight';
    }
  }

  String getKossher() {
    if (bmi >= 25) {
      return 'You have a too much weight , try Some exercise ';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight . Good Job!';
    } else {
      return 'You have a too low weight , might be dangerous , try Some exercise';
    }
  }
}
