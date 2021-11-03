import 'package:sfid_mobile/app/infrastructures/endpoints.dart';
import 'package:sfid_mobile/data/infrastructures/api_service_interface.dart';
import 'package:sfid_mobile/data/persistences/mappers/post_mapper.dart';
import 'package:sfid_mobile/data/persistences/repositories/contracts/post_repository.dart';
import 'package:sfid_mobile/domains/post_domain.dart';

class PostApiRepository implements PostRepository {
  final ApiServiceInterface _service;
  final Endpoints _endpoints;
  final PostMapper _mapper;

  PostApiRepository(this._service, this._endpoints, this._mapper);

  @override
  Future<List<Post>> getPosts() async {
    try {
      var posts = <Post>[];
      var response = await _service.invokeHttp(
        _endpoints.posts(),
        RequestType.GET,
      ) as List<dynamic>;

      for (var post in response) {
        posts.add(_mapper.toDomain(post));
      }

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}