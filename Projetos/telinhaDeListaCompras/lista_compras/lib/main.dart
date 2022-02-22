// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, unnecessary_new

import 'package:flutter/material.dart';
import 'package:lista_compras/components/description.dart';
import 'package:lista_compras/components/maincomponent.dart';
import 'package:lista_compras/models/gerador.dart';
import 'package:lista_compras/models/lista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Itens> _i = itens;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Listas de Compras"),
          ),
          body: SizedBox(
            child: ListView(
              children: _i
                  .map(
                    (e) => MainComponent(
                        title: e.title, description: e.description),
                  )
                  .toList(),
            ),
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
