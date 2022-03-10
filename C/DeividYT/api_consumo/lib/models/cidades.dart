class Cidade {
  final String id;
  final String nome;
  final String municipio;
  final String sigla;
  final String uf;

  Cidade(
      {required this.id,
      required this.nome,
      required this.uf,
      required this.sigla,
      required this.municipio});

  factory Cidade.fromJson(Map json) {
    return Cidade(
      id: json["id"],
      nome: json["nome"],
      municipio: json["municipio"]["nome"],
      uf: json["municipio"]["microrregiao"]["mesorregiao"]["UF"]["nome"],
      sigla: json["municipio"]["microrregiao"]["mesorregiao"]["UF"]["sigla"],
    );
  }

  @override
  String toString() {
    return id + " " + nome + "\n";
  }
}
