import 'dart:async';

import 'package:soid_mobile/data/persistences/repositories/contracts/post_repository.dart';
import 'package:soid_mobile/domains/post_domain.dart';
import 'package:soid_mobile/app/infrastructures/contracts/base_use_case.dart';

class GetPostsUseCase extends BaseUseCase<List<Post>, dynamic> {
  PostRepository _repository;

  GetPostsUseCase(this._repository);

  @override
  Future<List<Post>> getData(_) {
    return _repository.getPosts();
  }
}
