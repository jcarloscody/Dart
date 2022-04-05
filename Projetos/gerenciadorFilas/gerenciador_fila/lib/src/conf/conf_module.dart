import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_fila/src/conf/blocs/conf_bloc.dart';

final configurationModule = [
  BlocProvider(create: (context) => ConfBloc(context.read())),
];
