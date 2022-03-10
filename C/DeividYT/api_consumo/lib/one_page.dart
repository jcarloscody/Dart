import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  callAPI() async {
    var client = http.Client();
    try {
      inLoad.value = true;
      var response = await client.get(
        Uri.parse(
            "https://servicodados.ibge.gov.br/api/v1/localidades/distritos"),
      );
      //utf8.decode(response.bodyBytes)
      var decodedResponse = jsonDecode(response.body) as List;
      cidades.value = decodedResponse.map((e) => Cidade.fromJson(e)).toList();
      //var uri = Uri.parse(decodedResponse['uri'] as String);
      debugPrint(cidades.value[0].nome);
      debugPrint(cidades.value[0].uf);
    } finally {
      client.close();
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
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cidades.value.length,
                        itemBuilder: (_, index) => ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Text("cidade ${cidades.value[index].nome}"),
                                  Text(
                                      "municipio ${cidades.value[index].municipio}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(" uf ${cidades.value[index].uf} "),
                                  Text(" sigla ${cidades.value[index].sigla} "),
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.red,
                                height: 2,
                              )
                            ],
                          ),
                        ),
                      ),
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

class Cidade {
  final String id;
  final String nome;
  final String municipio;
  final String sigla;
  final String uf;

  Cidade(
      {required this.id,
      required this.nome,
      required this.uf,
      required this.sigla,
      required this.municipio});

  factory Cidade.fromJson(Map json) {
    return Cidade(
      id: json["id"],
      nome: json["nome"],
      municipio: json["municipio"]["nome"],
      uf: json["municipio"]["microrregiao"]["mesorregiao"]["UF"]["nome"],
      sigla: json["municipio"]["microrregiao"]["mesorregiao"]["UF"]["sigla"],
    );
  }

  @override
  String toString() {
    return id + " " + nome + "\n";
  }
}
