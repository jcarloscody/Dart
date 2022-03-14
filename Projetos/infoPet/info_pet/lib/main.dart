import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Pet"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
                child: Text("imagem"),
              ),
              const SizedBox(
                height: 30,
                child: Text("titulo"),
              ),
              const SizedBox(
                child: Text("info"),
              ),
              const SizedBox(height: 25),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: const Text(
                              "Pet 1",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            ),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: ElevatedButton(
                              child: const Text("Editar"),
                              onPressed: null,
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(5)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              ),
                            ),
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 7,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: const [
                                Text(
                                  "Nome",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Nome do Pet",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Center(
                              child: Column(
                                children: const [
                                  Text(
                                    "Animal",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Cão",
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 0, 15, 25),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: const [
                                Text(
                                  "Raça",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Labrador",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 0, 15, 25),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 7,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: const [
                                Text(
                                  "Idade do Pet?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Nome do pet",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: const [
                                Text(
                                  "Doença preexistente?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Não",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 7,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: const [
                                Text(
                                  "Animal de Competição?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Não",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: const [
                                Text(
                                  "Valor da Contratação",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                Text(
                                  "R\$ 27,90/mês",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Colors.black12,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      print("object");
                    },
                    child: const Text("Confirmar"),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                        (Set<MaterialState> states) {
                          return const EdgeInsets.all(20);
                        },
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
