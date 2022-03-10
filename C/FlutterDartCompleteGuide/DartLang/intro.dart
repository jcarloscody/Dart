double addNumbers(double num1, double num2) {
  return num1 * num2;
}

void addNumbers2(num1, num2) {
  print(num1 * num2);
}

void main(List<String> args) {
  print(addNumbers(2, 3.2));
  var firstResult = addNumbers(3, 4);
  double secondResult = addNumbers(4, 5);
  addNumbers2(2, 3);

  var p1 = Person("lj", 12);
  var p2 = Person2(nome: "lk");
  print(p1._address);

  var p3 = Person3(nome: "lk", age: 12);
  print(p3.age);

  var p4 = Person4.veryOld("nome");
}

class Person {
  String? nome;
  int? age;
  String _address = "lksd";

  Person(String nome, int age) {
    this.nome = nome;
    this.age = age;
  }
}

class Person2 {
  String? nome;
  int? age;
  String _address = "lksd";

  Person2({required String? nome, int? age}) {
    this.nome = nome;
    this.age = age;
  }
}

class Person3 {
  String? nome;
  int? age;
  String _address = "lksd";

  Person3({required String? this.nome, int? this.age});
}

class Person4 {
  String? nome;
  int? age;
  String _address = "lksd";

  Person4({required String? this.nome, int? this.age});
  //multi construtores
  Person4.veryOld(this.nome) {
    this.age = 70;
  }
}
