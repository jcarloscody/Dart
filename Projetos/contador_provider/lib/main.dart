import 'package:contador_provider/controller/contador.dart';
import 'package:contador_provider/controller/super_contador.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Contador()),
        ChangeNotifierProvider(create: (context) => SuperContador()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ChangeNotifierProvider(
        //   create: (context) => Contador(),
        //   child: IncWidget(),
        // ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerC = context.watch<Contador>();
    final controllerS = context.watch<SuperContador>();
    var valor = controllerC.get() + controllerS.get();

    return Scaffold(
      appBar: AppBar(
        title: const Text("contador"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              valor.toString(),
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                Provider.of<Contador>(context, listen: false).incrementador();
              },
              child: const Icon(Icons.plus_one),
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<Contador>(context, listen: false).decrementador();
              },
              child: Row(
                children: const [
                  Icon(Icons.remove),
                  Text("1"),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<SuperContador>(context, listen: false)
                    .incrementador();
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<SuperContador>(context, listen: false)
                    .decrementador();
              },
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
