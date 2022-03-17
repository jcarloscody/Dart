import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/contador.dart';

class IncWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("contador"),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Center(
                child: Consumer<Contador>(
                  builder: (context, valor, child) {
                    return Text(
                      valor.get().toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Contador>(context, listen: false).incrementador();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
