import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/domain/repositories/queue_repository.dart';
import 'package:gerenciador_fila/src/queue/infra/adapters/json_to_queue.dart';
import 'package:gerenciador_fila/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepository implements IQueueRepository {
  final IQueueDatasource iQueueDatasource;

  QueueRepository({required this.iQueueDatasource});

  @override
  Stream<List<QueueEntity>> call() {
    final stream = iQueueDatasource.getAllQueues();

    return stream.map(_convert);
  }

  List<QueueEntity> _convert(List<Map> lista) {
    return lista.map(JsonToQueue.fromMap).toList();
  }
}
