import 'package:flutter_test/flutter_test.dart';
import 'package:mmksi_vts_mobile/data/persistences/mappers/post_mapper.dart';
import 'package:mmksi_vts_mobile/domains/post_domain.dart';

void main() {
  group('PostMapper', () {
    late PostMapper mapper;
    late Map<String, dynamic> response;

    setUp(() {
      mapper = PostMapper();
      response = <String, dynamic>{
        'userId': 1,
        'id': 1,
        'title': 'lorem ipsum dolor',
        'body': 'lorem ipsum dolor sit amet',
      };
    });

    test('should return post domain from response', () {
      var domain = mapper.convert(response);

      expect(domain, isA<Post>());
      expect(domain.title, response['title']);
      expect(domain.body, response['body']);
    });
  });
}
