import 'package:flutter/material.dart';
import 'package:gerenciador_fila/src/conf/conf_module.dart';
import 'package:gerenciador_fila/src/conf/pages/configuration_page.dart';
import 'package:gerenciador_fila/src/queue/queue_module.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
      ],
      child: const MaterialApp(
        home: ConfigurationPage(),
      ),
    );
  }
}
