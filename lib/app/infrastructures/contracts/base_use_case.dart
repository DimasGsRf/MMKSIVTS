import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

abstract class BaseUseCase<DATA, PARAMS> extends UseCase<DATA, PARAMS> {
  Future<DATA> getData(PARAMS? params);

  @override
  Future<Stream<DATA?>> buildUseCaseStream(PARAMS? params) async {
    final StreamController<DATA> _controller = StreamController();

    try {
      var data = await getData(params);

      _controller.add(data);
    } catch (e, stackTrace) {
      // Better log stacktrace than log e
      if (kDebugMode) {
        print('ERROR: $e');
        print('STACKTRACE: $stackTrace');
      }

      _controller.addError(e);
    } finally {
      _controller.close();
    }

    return _controller.stream;
  }
}
