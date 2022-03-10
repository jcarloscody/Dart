// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:api_consumo/controller/api_cidades.dart';
import 'package:api_consumo/widgets/show_cidades.dart';
import 'package:flutter/material.dart';

import '../models/cidades.dart';
import 'custom_widget_button.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<List<Cidade>> cidades = ValueNotifier<List<Cidade>>([]);
  ValueNotifier<bool> inLoad = ValueNotifier<bool>(false);
  //ValueNotifier >> é um gerenciador de estado que gera a possibilidade de fazer  a reconstrucao de um determinado bloco de codigo e esse bloco é onde ocorre normalmente a nossa volatilidade do codigo, onde o dado sofrera constante auteraçoes. dessa forma não recriamos toda a page

  // callAPI() async {
  //   var client = http.Client();
  //   try {
  //     inLoad.value = true;
  //     var response = await client.get(
  //       Uri.parse(
  //           "https://servicodados.ibge.gov.br/api/v1/localidades/distritos"),
  //     );
  //     //utf8.decode(response.bodyBytes)
  //     var decodedResponse = jsonDecode(response.body) as List;
  //     cidades.value = decodedResponse.map((e) => Cidade.fromJson(e)).toList();
  //     //var uri = Uri.parse(decodedResponse['uri'] as String);
  //     debugPrint(cidades.value[0].nome);
  //     debugPrint(cidades.value[0].uf);
  //   } finally {
  //     client.close();
  //     inLoad.value = false;
  //   }
  // }

  callAPI() async {
    inLoad.value = true;
    try {
      cidades.value =
          CidadesAPI.callAPI().map((e) => Cidade.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    } finally {
      inLoad.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* ValueListenableBuilder<List<Cidade>>(
                valueListenable: cidades,
                builder: (_, value, __) => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(value[index].id),
                  ),
                ),
              ),*/
              AnimatedBuilder(
                animation: Listenable.merge([cidades, inLoad]),
                builder: (context, child) => inLoad.value
                    ? const CircularProgressIndicator()
                    : ShowCidades(lista: cidades.value),
              ),
              CustomButtonWidget(
                onPressed: () => callAPI(),
                state: false,
                title: "SHOW",
                fontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
