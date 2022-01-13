void main(List<String> args) {
  final questions; //o final é semelhante a const, porém pode deixar para ser inicializado posteriormente e após não poderá ser alterado
  questions = [
    //
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
  ];

//a variavel é constante
  const q = [
    //o const é obrigatorio ser inicializado e após não poderá ser alterado
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
  ];

  //o valor é constante
  var qu = const [
    //neste a variação nao poderá ser aditada, porém poderá ser reconstruida qu=[]
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
  ];

//erros
  /*q.add({
    'questionText': 'What\'s your favorite color?',
    'answers': ['Black', 'Red', 'Green', 'White']
  });
  qu.add({
    'questionText': 'What\'s your favorite color?',
    'answers': ['Black', 'Red', 'Green', 'White']
  });

  questions.add({
    'questionText': 'What\'s your favorite color?',
    'answers': ['Black', 'Red', 'Green', 'White']
  });*/

  qu = [];
  qu.add({
    'questionText': 'What\'s your favorite color?',
    'answers': ['Black', 'Red', 'Green', 'White']
  });
  print(qu);

  if (true) {
  } else {}

  //segurança nula -  o dart executa verificacoes extras em seu codigo nos bastidores para capturar tais cenarios
  String? userName; //a variavel por conter string ou conter um tipo null
  userName =
      null; //null - é um tipo que expressa simplesmente que nao queremos ter um valor

  var user; //vazio
}
