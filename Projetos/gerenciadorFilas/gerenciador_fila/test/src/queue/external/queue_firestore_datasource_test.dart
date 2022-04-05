import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_fila/src/queue/external/queue_firestore_datasource.dart';

void main() async {
  test("Consulta ao firebase", () async {
    final instance = FakeFirebaseFirestore();
    await instance.collection('queue').add({
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
        },
        {
          'id': '2',
          'position': 2,
          'timestamp': '2022-03-31 18:37:30',
          'status': 'attending'
        }
      ]
    });
    final datasource = QueueFireStoreDataSource(firestore: instance);
    final result = datasource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });
}
