import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/domain/repositories/queue_repository.dart';
import 'package:gerenciador_fila/src/queue/domain/usecases/get_all_queue.dart';
import 'package:mocktail/mocktail.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

void main() {
  test("deve pegar todos queue entity", () {
    final repository = QueueRepositoryMock();

    final entity = QueueEntityMock();

    when(() => repository.call())
        .thenAnswer((invocation) => Stream.value([entity]));

    final getAllQueueUsecase = GetAllQueue(iQueueRepository: repository);

    final result = getAllQueueUsecase.call();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
