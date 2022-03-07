import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7B1FA2),
          toolbarTextStyle: TextStyle(
            color: Color.fromARGB(0, 0, 0, 10),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailKeyy = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _emailKeyy.dispose();
    _name.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 30,
                left: 30,
                bottom: 10,
                top: 20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: const Text("Faça o login para entrar na CasaGrande"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            //nome
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 7, 20, 7),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF7B1FA2),
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                hintText: "Informe seu nome",
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              validator: Validatorless.multiple(
                                [
                                  Validatorless.required("Nome obrigatório"),
                                  Validatorless.min(
                                      4, "Deve ter no mínimo 4 caracteres!"),
                                ],
                              ),
                              controller: _name,
                            ),
                          ),
                          Container(
                            //email
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                suffixIcon: const Icon(Icons.email),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 7, 20, 7),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF7B1FA2),
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                hintText: "Informe seu nome",
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              validator: Validatorless.multiple(
                                [
                                  Validatorless.required("Email obrigatório"),
                                  Validatorless.email("Email Invalido"),
                                ],
                              ),
                              controller: _emailKeyy,
                            ),
                          ),
                          Container(
                            //senha
                            margin: const EdgeInsets.only(
                              bottom: 1,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: const Icon(Icons.remove_red_eye),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 7, 20, 7),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF7B1FA2),
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                hintText: "Digite a sua senha",
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              validator: Validatorless.multiple(
                                [
                                  Validatorless.required("Senha obrigatória"),
                                  Validatorless.min(8,
                                      "A senha deve ter no mínimo 8 caracteres"),
                                ],
                              ),
                              controller: _password,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Faça o login ou crie uma conta"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 55,
                    child: ElevatedButton(
                      child: const Text("Sign Up"),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(top: 17, bottom: 17)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        var formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          //call controller
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 17, bottom: 17),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 55,
                    child: ElevatedButton(
                      child: const Text("Sign Up with Apple"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF4A148C)),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.only(top: 17, bottom: 17),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        var formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          //call controller
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
