import 'dart:math';

class PasswordGenerator {
  String generarPassword({
    required int length,
    required bool mayusculas,
    required bool minusculas,
    required bool numeros,
    required bool simbolos,
  }) {
    String listaMayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String listaMinusculas = 'abcdefghijklmnopqrstuvwxyz';
    String listaNumeros = '0123456789';
    String listaSimbolos = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

    String caracteresPermitios = "";

    if(!mayusculas && !minusculas && !numeros && !simbolos){
      return "";
    }

    mayusculas ? caracteresPermitios += listaMayusculas : null;
    minusculas ? caracteresPermitios += listaMinusculas : null;
    numeros ? caracteresPermitios += listaNumeros : null;
    simbolos ? caracteresPermitios += listaSimbolos : null;

    String passwordGenerada = "";



    final Random random = Random();

    for (int i = 0; i < length; i++) {
      int indiceAleatorio = random.nextInt(caracteresPermitios.length);
      passwordGenerada += caracteresPermitios[indiceAleatorio];
    }

    return passwordGenerada;
  }
}
