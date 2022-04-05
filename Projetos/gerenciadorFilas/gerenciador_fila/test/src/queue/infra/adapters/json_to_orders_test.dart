import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_fila/src/queue/domain/value_objects/enum/status.dart';
import 'package:gerenciador_fila/src/queue/domain/value_objects/order.dart';
import 'package:gerenciador_fila/src/queue/infra/adapters/json_to_orders.dart';

void main() {
  test("converter de Map to Order", () {
    final order = JsonToOrder.fromMap({
      'id': 'sdsdsd',
      'position': 1,
      'timestamp': '2022-03-31 18:37:30',
      'status': 'attending',
    });

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });
}
