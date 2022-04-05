import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/infra/adapters/json_to_orders.dart';

class JsonToQueue {
  static QueueEntity fromMap(dynamic json) {
    return QueueEntity(
        id: '',
        title: json['title'],
        abbr: json['abbr'],
        priority: json['priority'],
        orders: json.containsKey('orders')
            ? (json['orders'] as List).map(JsonToOrder.fromMap).toList()
            : []); //1:29
  }
}
