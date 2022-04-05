import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';

abstract class IQueueRepository {
  Stream<List<QueueEntity>> call();
}
