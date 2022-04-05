import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/domain/value_objects/enum/status.dart';
import 'package:gerenciador_fila/src/queue/infra/adapters/json_to_queue.dart';

void main() {
  test("converter para fila queue", () {
    final queue = JsonToQueue.fromMap({
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
      ],
    });

    expect(queue, isA<QueueEntity>());
    expect(queue.priority, 1);
    expect(queue.orders.first.status, OrderStatus.attending);
  });
}
