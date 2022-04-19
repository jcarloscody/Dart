class Animal {
  String? _cor;

  set cor(cor) {
    this._cor = cor;
  }

  get cor {
    return this._cor;
  }

  void dormir() {
    print("Dormir");
  }
}

class Cao extends Animal {
  String? _corOrelha;

  set corOrelha(c) {
    this._corOrelha = c;
  }

  get corOrelha {
    return this._corOrelha;
  }

  void latir() {
    print("Latir");
  }
}

class Passaro extends Animal {
  String? corBico;
  void voar() {
    print("Voar");
  }
}

void main() {
  Cao cao = Cao();
  Passaro passaro = Passaro();

  cao.cor = "Branco";
  cao.corOrelha = "Preto";
  print("Cor do cão: " + cao.cor);
  print("Cor da orelha: " + cao.corOrelha);
  cao.latir();

  passaro.cor = "Marrom";
  print(passaro.cor);
  passaro.voar();
}
