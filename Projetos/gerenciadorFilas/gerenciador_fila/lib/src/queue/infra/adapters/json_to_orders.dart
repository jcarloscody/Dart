import 'package:gerenciador_fila/src/queue/domain/value_objects/enum/status.dart';

import '../../domain/value_objects/order.dart';

class JsonToOrder {
  static Order fromMap(dynamic l) {
    return Order(
      id: l['id'],
      position: l['position'],
      timestamp: DateTime.parse(l['timestamp']),
      status: OrderStatus.values.firstWhere(
        (element) => element.name == l['status'],
      ),
    );
  }
}
