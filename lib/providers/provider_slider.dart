import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/password_generator.dart';

class ProviderSlider with ChangeNotifier {
  double sizeSlider = 6;
  String passwordGenerada = "";
  List<String> listaPasswords = [];

  void setSizeSlider(double nuevoValor) {
    sizeSlider = nuevoValor;
    notifyListeners();
  }

  bool mayusculas = false;
  bool numeros = false;
  bool simbolos = false;
  bool minusculas = true;

  bool get getMayusculas => mayusculas;
  bool get getNumeros => numeros;
  bool get getSimbolos => simbolos;
  bool get getMinusculas => minusculas;

  void setMayusculas(bool valor) {
    mayusculas = valor;
    notifyListeners();
  }

  void setNumeros(bool valor) {
    numeros = valor;
    notifyListeners();
  }

  void setSimbolos(bool valor) {
    simbolos = valor;
    notifyListeners();
  }

  void setMinusculas(bool valor) {
    minusculas = valor;
    notifyListeners();
  }

  void createPassword() {
    passwordGenerada = PasswordGenerator().generarPassword(
      length: sizeSlider.toInt(),
      minusculas: minusculas,
      mayusculas: mayusculas,
      numeros: numeros,
      simbolos: simbolos,
    );
    if (passwordGenerada.isEmpty) {
      return;
    }
    listaPasswords.add(passwordGenerada);
    notifyListeners();
  }

  void eliminarPassword(int index) {
    listaPasswords.removeAt(index);
    notifyListeners();
  }
}
