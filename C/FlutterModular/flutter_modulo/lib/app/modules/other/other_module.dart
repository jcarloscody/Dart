import 'package:flutter_modular/flutter_modular.dart';

class OtherModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Controller(i(), i())),
  ];

  // @override
  // final List<ModularRoute> routes = [];

}

class Controller {
  final String name;
  final bool isInjected;

  Controller(this.name, this.isInjected);
  prin() {
    print(name);
  }

  printText() {
    print("printado");
  }
}
