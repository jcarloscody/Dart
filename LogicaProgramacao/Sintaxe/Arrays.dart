void main() {
  var nome = [];
  print(nome);

  nome.add("josue");
  nome.add(23);
  nome.add("josue");

  print(nome);
  print(nome.length);
  print(nome[0]);

  nome.remove("josue");
  nome.removeAt(1);
  print(nome);

  //tipagem de Arrays
  List<String> listArray = [];

  listArray.add("sjo");
}
