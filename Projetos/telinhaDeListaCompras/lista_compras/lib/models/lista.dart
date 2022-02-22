class Itens {
  int id;
  String description;
  String title;
  double valor;
  int quantidade;

  Itens(
      {this.id = 0,
      required this.description,
      required this.title,
      required this.quantidade,
      required this.valor}) {}
}
