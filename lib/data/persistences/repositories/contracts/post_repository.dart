import 'package:mmksi_vts_mobile/domains/post_domain.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
