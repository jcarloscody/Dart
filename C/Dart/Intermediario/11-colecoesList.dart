/*
Collection ou coleções -> são implementações de estruturas de dados, que é utilizado para armazenar itens
 - List
 - Maps
*/

class Usuario {
  String nome;
  int idade;

  Usuario({required this.nome, required this.idade});
}

void main() {
  List<String> frutas = ["Morango", "Manga", "Melancia"];
  List numero = [1, 5, "Jamilton", 10.60];
  List<String?> sd = [];
  //adicionar itens
  frutas.add("Melancia");
  print("FRUTAS:");
  print(frutas);
  //Inserir em uma posição
  frutas.insert(1, "Abacaxi");
  print("FRUTAS:");
  print(frutas);
  //Remover item
  frutas.removeAt(1);

  //Verificar item na lista
  print(frutas.contains("Pera"));

  //tamanho da lista
  print(frutas.length);
  print(frutas);

  //Armazenar objetos

  List<Usuario> usuarios = [];
  usuarios.add(Usuario(nome: "sd", idade: 12));

  for (Usuario usuario in usuarios) {
    print("Nome: ${usuario.nome} idade: ${usuario.idade}");
  }

  //print( usuarios );
}
