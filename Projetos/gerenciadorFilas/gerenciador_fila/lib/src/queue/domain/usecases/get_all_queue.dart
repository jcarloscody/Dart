import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/domain/repositories/queue_repository.dart';

abstract class IGetAllQueues {
  Stream<List<QueueEntity>> call();
}

class GetAllQueue implements IGetAllQueues {
  final IQueueRepository iQueueRepository;

  GetAllQueue({required this.iQueueRepository});

  @override
  Stream<List<QueueEntity>> call() {
    return iQueueRepository.call();
  }
}
