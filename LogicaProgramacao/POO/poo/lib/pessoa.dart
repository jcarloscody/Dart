import 'package:poo/humano.dart';

class Pessoa extends Humano{
  String nome;
  int idade;
  
  String _privado;
  final int constante = 10;
  /*Pessoa({String nome, int idade}) {
    this.nome = nome;
    this.idade = idade;
  }*/

  Pessoa({ this.nome, this.idade, this._privado, peso}) : super(peso: peso)

  String getNome(){
    return this.nome;
  }

  int getIdade() => this.idade;
}
