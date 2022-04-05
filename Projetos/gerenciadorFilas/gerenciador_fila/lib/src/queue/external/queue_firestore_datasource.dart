import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gerenciador_fila/src/queue/infra/datasource/queue_datasource.dart';

class QueueFireStoreDataSource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  QueueFireStoreDataSource({required this.firestore});

  @override
  Stream<List<Map>> getAllQueues() {
    final ref = firestore.collection("queue");
    final snapshot = ref.snapshots();

    return snapshot.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> lista) {
    return lista
        .map(
          (e) => {
            'id': e.id,
            //...e.data(),
            'title': e['title'],
            'priority': e['priority'],
            'abbr': e['abbr'],
            'orders': e['orders'],
          },
        )
        .toList();
  }
}

//flutter pud add firebase_core