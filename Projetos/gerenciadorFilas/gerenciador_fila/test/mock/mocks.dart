import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:gerenciador_fila/src/queue/domain/usecases/get_all_queue.dart';
import 'package:gerenciador_fila/src/queue/infra/adapters/json_to_orders.dart';
import 'package:gerenciador_fila/src/queue/infra/datasource/queue_datasource.dart';
import 'package:gerenciador_fila/src/queue/infra/repositories/queue_repository.dart';
import 'package:mocktail/mocktail.dart';

class OrderMock extends Mock implements JsonToOrder {}

class QueueRepositoryMock extends Mock implements QueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class QueueDataSourceMock extends Mock implements IQueueDatasource {}

class IGetAllQueuesMock extends Mock implements IGetAllQueues {}
