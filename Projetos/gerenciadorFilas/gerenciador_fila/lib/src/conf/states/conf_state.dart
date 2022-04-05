import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';

abstract class ConfState {}

class EmptyConfState implements ConfState {}

class LoadingConfState implements ConfState {}

//carregado
class LoadedConfState implements ConfState {
  final List<QueueEntity> listQueueEntity;

  LoadedConfState({required this.listQueueEntity});
}

class ExceptionConfState implements ConfState {
  final String msg;

  ExceptionConfState({required this.msg});
}
