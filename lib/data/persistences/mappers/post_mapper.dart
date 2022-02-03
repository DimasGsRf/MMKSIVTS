import 'package:mmksi_vts_mobile/app/infrastructures/contracts/base_mapper.dart';
import 'package:mmksi_vts_mobile/domains/post_domain.dart';

class PostMapper extends BaseMapper<Post> {
  @override
  Post convert(Map<String, dynamic> response) {
    return Post(title: response['title'], body: response['body']);
  }
}
