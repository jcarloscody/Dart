import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_modulo/app/app_module.dart';
import 'package:flutter_modulo/app/modules/other/other_module.dart';
import 'package:flutter_test/flutter_test.dart'; //vai facilitar os testes inclusive testes de integração4

void main(List<String> args) {
  // initModule(AppModule());
  initModules([AppModule(), OtherModule()]);

  test("Get Controller", () {
    final controller = Modular.get<
        Controller>(); //esse get Controller esta no OtherModule q vai resolver com uma dependencia do AppModule e vai fazer tudo isso automatico. lembre-se que a string está no modulo pai
    final controller2 = Modular.get<Controller>();
    controller.printText();
    print(controller2.hashCode);
    print(controller.hashCode);

    final nome = Modular.get<String>;

    print(nome);
  });
  // test("Get Controller", () {
  //   final controller = Modular.get<Controller>();
  //   controller.printText(); //vai pegar os binds e resolve-los
  // });
}
