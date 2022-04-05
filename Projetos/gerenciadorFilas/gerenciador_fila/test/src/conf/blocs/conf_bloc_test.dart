import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_fila/src/conf/blocs/conf_bloc.dart';
import 'package:gerenciador_fila/src/conf/states/conf_state.dart';
import 'package:gerenciador_fila/src/queue/domain/entities/queue_entity.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mocks.dart';

void main() {
  test("conf bloc", () async {});

  blocTest("conf bloc...",
      build: () {
        final usecase = IGetAllQueuesMock();

        when(() => usecase.call())
            .thenAnswer(((invocation) => Stream.value([])));

        return ConfBloc(usecase);
      },
      expect: () => [
            isA<LoadedConfState>(),
          ]);
}
