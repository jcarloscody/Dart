import 'package:api_consumo/models/cidades.dart';
import 'package:flutter/material.dart';

class ShowCidades extends StatelessWidget {
  final List<Cidade> lista;
  const ShowCidades({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lista.length,
      itemBuilder: (_, index) => ListTile(
        title: Column(
          children: [
            Row(
              children: [
                Text("cidade ${lista[index].nome}"),
                Text("municipio ${lista[index].municipio}"),
              ],
            ),
            Row(
              children: [
                Text(" uf ${lista[index].uf} "),
                Text(" sigla ${lista[index].sigla} "),
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
    );
  }
}
