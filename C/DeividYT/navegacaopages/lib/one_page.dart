import 'package:flutter/material.dart';
import 'package:navegacaopages/two_page.dart';
import 'package:navegacaopages/widgets/custom_widget_button.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TwoPage(),
                ),
              );*/

              Navigator.of(context)
                  .pushNamed("/twoPage", arguments: "argumentos")
                  .then(
                    (value) => print(value),
                  );
              //pushReplacementNamed  -> este dá o push e exclui a pagina impossibilitadno o retron
            },
            child: const Text('Ir para outra pagina'),
          ),
          CustomButtonWidget(
            onPressed: () {},
            title: "helloooooo",
            state: false,
            fontSize: 20,
          )
        ],
      ),
    ));
  }
}
