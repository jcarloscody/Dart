void main(List<String> args) {
  var maps = {
    "nome": "sem nome",
    "idade": 23,
    "endereco": {
      "rua": "canario",
      "nu": 24,
    }
  };

  print(maps["idade"]);
  print(maps["endereco"]);

  //tipagem
  Map<String, dynamic> mapa = {
    "nome": "sem nome",
    "idade": 23,
    "endereco": {
      "rua": "canario",
      "nu": 24,
    }
  };

  //array de maps
  List<Map<String, dynamic>> cadasttros = [];
  cadasttros.add(mapa);
  cadasttros.add(maps);
  print(cadasttros);
}
