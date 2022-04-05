import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciador_fila/src/conf/event/conf_event.dart';
import 'package:gerenciador_fila/src/conf/states/conf_state.dart';
import 'package:gerenciador_fila/src/queue/domain/usecases/get_all_queue.dart';

class ConfBloc extends Bloc<ConfEvent, ConfState> {
  final IGetAllQueues getAllqueuesUseCase;
  late final StreamSubscription _sub;

  ConfBloc(this.getAllqueuesUseCase) : super(EmptyConfState()) {
    _sub = getAllqueuesUseCase.call().listen((data) {
      add(AddQueues(data));
    });
    on<AddQueues>(((event, emit) =>
        emit(LoadedConfState(listQueueEntity: event.queues))));
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    await super.close();
  }
}
