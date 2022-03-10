//fortemente tipada
//suporta inferencia
void main(List<String> args) {
  int a = 1;
  print(a);

  var nomes = [1, 2, 4, 5];

  nomes.add(12);
  print(nomes.length);

  print(nomes.elementAt(2));
  print(nomes[nomes.length - 1]);

  var conjunto = {0, 2, 4, 5, 3, 5, 5, 5, 5};
  print(conjunto.length);
  print(conjunto is Set);

  Map<String, double> notasAlunos = {"josue": 12.2};

  for (var n in notasAlunos.entries) {
    print("${n.key}  ${n.value}");
  }

  dynamic x = "lkl"; //permite tratamento fracamente tipada
  x = 1212;

  soma(a, b) {
    print(a + b);
  }

  soma(2, 4);

  exec(int a, int b, Function(int, int) fn) {
    return fn(a, b);
  }

  print(exec(2, 2, (p0, p1) => p0 + p1));
}
