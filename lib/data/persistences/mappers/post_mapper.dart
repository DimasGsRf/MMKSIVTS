import 'package:sfid_mobile/domains/post_domain.dart';

class PostMapper {
  Post toDomain(Map<String, dynamic> response) {
    return Post(title: response['title'], body: response['body']);
  }
}
