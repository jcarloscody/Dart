import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';

abstract class ConfEvent {}

class AddQueues implements ConfEvent {
  final List<QueueEntity> queues;

  AddQueues(this.queues);
}
