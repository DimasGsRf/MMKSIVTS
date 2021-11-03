import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sfid_mobile/data/persistences/repositories/contracts/post_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:sfid_mobile/domains/post_domain.dart';

class GetPostsUseCase extends UseCase<List<Post>, dynamic> {
  PostRepository _repository;

  GetPostsUseCase(this._repository);

  @override
  Future<Stream<List<Post>?>> buildUseCaseStream(dynamic params) async {
    final _controller = StreamController<List<Post>>();

    try {
      var posts = await _repository.getPosts();

      _controller.add(posts);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
      }

      _controller.addError(e);
    } finally {
      _controller.close();
    }

    return _controller.stream;
  }
}
