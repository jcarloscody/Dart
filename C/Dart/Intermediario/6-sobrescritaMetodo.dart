class Animal {
  String cor;
  int idade;
  Animal(this.cor, this.idade);

  void dormir() {
    print("Dormir");
  }

  void correr() {
    print("Correr ");
    print("como");
    print("um");
  }
}

class Cao extends Animal {
  String corOrelha;

  Cao(String cor, this.corOrelha, int idade) : super(cor, idade);

  void latir() {
    print("Latir");
  }

  @override //sobrepor
  void correr() {
    super.correr();
    print(" cão!");
  }
}

class Passaro extends Animal {
  String corBico;

  Passaro(String cor, this.corBico, int idade) : super(cor, idade);

  void voar() {
    print("Voar");
  }

  @override //sobrepor
  void correr() {
    super.correr();
    print(" passaro!");
  }
}

void main() {
  Cao cao = Cao("Marrom", "Branco", 12);
  Passaro passaro = Passaro("Vermelho", "Amarelo", 34);

  print("Passaro cor: ${passaro.cor} corBico: ${passaro.corBico} ");

  /*
  cao.correr();
 	passaro.correr(); */

  /*
  cao.cor = "Branco";
  cao.corOrelha = "Preto";
  print( "Cor do cão: " + cao.cor );
  print( "Cor da orelha: " + cao.corOrelha );
  cao.latir();
  
  passaro.cor = "Marrom";
  print( passaro.cor );
  passaro.voar();
  */
}
