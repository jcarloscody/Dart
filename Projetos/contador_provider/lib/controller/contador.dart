import 'package:flutter/material.dart';

class Contador extends ChangeNotifier {
  int _contador = 0;

  int get() {
    return _contador;
  }

  incrementador() {
    _contador += 1;
    notifyListeners();
  }

  decrementador() {
    _contador -= 1;
    notifyListeners();
  }
}
