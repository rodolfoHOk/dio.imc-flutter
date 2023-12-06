import 'package:flutter/material.dart';

class IMC {
  final String _id = UniqueKey().toString();
  final double _weight;
  final double _height;
  final DateTime _date = DateTime.now();

  IMC(this._weight, this._height);

  double calculate() {
    return _weight / (_height * _height);
  }

  String get id => _id;

  double get weight => _weight;

  double get height => _height;

  DateTime get date => _date;

  String getClassification(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc < 17) {
      return "Magreza moderada";
    } else if (imc < 18.5) {
      return "Magreza leve";
    } else if (imc < 25) {
      return "Saudável";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau I";
    } else if (imc < 40) {
      return "Obesidade Grau II (severa)";
    } else {
      return "Obesidade Grau III (mórbida)";
    }
  }
}
