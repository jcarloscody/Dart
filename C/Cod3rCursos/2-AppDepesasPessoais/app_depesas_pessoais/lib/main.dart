import 'package:app_depesas_pessoais/models/transactions.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(id: "1", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "2", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "3", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "4", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "5", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "6", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "7", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "8", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "9", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "10", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "11", title: "Tenis", value: 365.56, date: DateTime.now()),
    Transaction(id: "12", title: "Tenis", value: 365.56, date: DateTime.now()),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Despesas Pessoais")),
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text(
                "Gráfico",
              ),
              elevation: 8,
              color: Colors.amber,
            ),
            width: double.infinity,
          ),
          Column(
            children: _transactions
                .map((e) => Card(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "R\$ ${e.value.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.brown,
                                width: 2,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                e.date.toString(),
                                style: TextStyle(color: Colors.grey[500]),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
