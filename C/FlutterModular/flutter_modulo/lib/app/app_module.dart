import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modulo/app/modules/bas/bas_module.dart';

class AppModule extends Module {
  @override //vc tbm pode fazer no OtherModule q tbm vai funcionar. a diferença que no OtherModule...
  final List<Module> imports = [
    //é q ele nao vai pegar um singleton global, ele vai pegar um cara local
    BasModule(),
  ];

  @override
  final List<Bind> binds = [
    //Bind.factory((i) => Controller())
    // Bind.singleton((i) => Controller(i())),
    Bind.instance<String>("jao"),
  ]; //aqui fica todas as injeçoes de dependencias q

  // @override
  // final List<ModularRoute> routes = [
  //   ModuleRoute('/auth', module: AuthModule())
  // ]; //rotas
}

// class Controller {
//   final String name;
//   Controller(this.name);
//   prin() {
//     print(name);
//   }

//   printText() {
//     print("printado");
//   }
// }
