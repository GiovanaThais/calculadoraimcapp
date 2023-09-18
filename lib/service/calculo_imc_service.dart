import 'dart:math';

class CalculoIMCService {
  double calcularIMC(double peso, double altura) {
    return peso / (altura * altura);
  }
}
