import 'package:flutter/material.dart';

class SuperContador extends ChangeNotifier {
  int _contador = 0;

  int get() {
    return _contador;
  }

  incrementador() {
    _contador += 10;
    notifyListeners();
  }

  decrementador() {
    _contador -= 10;
    notifyListeners();
  }
}
