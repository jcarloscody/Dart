import 'dart:io';  //biblioteca para in/out  de dados

void main() {
 /* print("hello");
  print(12);

  var saudacao= "qual o seu nome?";
  var idade= 10;

  print(saudacao);
  print(idade);
  
  print(saudacao + "e sua idade?");

  if (idade>=18) {
    print("maior de idade");
  } else {
    print("menor");
  }

  print("digite a idade:");**/

  var input = stdin.readLineSync();
  var idade = int.parse("90");

  if (idade>18) {
    
  } else if(idade > 190){
  } else {

  }

  var nome = stdin.readLineSync();
  funcaoCalc(nome);

}

funcaoCalc(nome){
  print("ola " + nome);
}