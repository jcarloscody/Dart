import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  child: const Text("Faça o login para entrar na CasaGrande"),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: null,
                      labelText: 'Nome',
                      contentPadding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
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
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Endereço de Email',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 35, 20, 0),
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
                        hintText: "Digite seu endereço de email",
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 35, 20, 0),
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
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: const Text("buttons"),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
