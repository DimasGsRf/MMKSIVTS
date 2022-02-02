import '../../../domains/post_domain.dart';
import 'base_mapper.dart';

class PostMapper extends BaseMapper<Post> {
  @override
  Post convert(Map<String, dynamic> response) {
    return Post(title: response['title'], body: response['body']);
  }
}
