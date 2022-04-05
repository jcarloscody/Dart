import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gerenciador_fila/src/queue/domain/repositories/queue_repository.dart';
import 'package:gerenciador_fila/src/queue/domain/usecases/get_all_queue.dart';
import 'package:gerenciador_fila/src/queue/external/queue_firestore_datasource.dart';
import 'package:gerenciador_fila/src/queue/infra/datasource/queue_datasource.dart';
import 'package:gerenciador_fila/src/queue/infra/repositories/queue_repository.dart';
import 'package:provider/provider.dart';

final queueModule = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: ((context) =>
          QueueFireStoreDataSource(firestore: context.read()))),
  Provider<IQueueRepository>(
      create: ((context) => QueueRepository(iQueueDatasource: context.read()))),
  Provider<IGetAllQueues>(
      create: ((context) => GetAllQueue(iQueueRepository: context.read()))),
];
