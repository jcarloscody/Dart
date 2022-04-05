import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/infra/repositories/queue_repository.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mock/mocks.dart';

void main() {
  test(
    "fila - repositorio",
    (() {
      final dataSource = QueueDataSourceMock();
      when(() => dataSource.getAllQueues())
          .thenAnswer((invocation) => Stream.value([
                {
                  'id': 'asdasd',
                  'title': 'json[]',
                  'abbr': 'kj',
                  'priority': 1,
                  'orders': [
                    {
                      'id': '1',
                      'position': 2,
                      'timestamp': '2022-03-31 18:37:30',
                      'status': 'attending'
                    }
                  ]
                }
              ]));

      final repositoryMock = QueueRepository(iQueueDatasource: dataSource);
      final result = repositoryMock.call();
      expect(result, emits(isA<List<QueueEntity>>()));
    }),
  );
}
