import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sfid_mobile/app/repositories/api/post_repository.dart';
import 'package:sfid_mobile/domains/post_domain.dart';

import 'post_repositort_test.mocks.dart';

@GenerateMocks([PostApiRepository])
void main() {
  group('PostApiRepository', () {
    late MockPostApiRepository repository;
    late List<Post> response;

    setUp(() {
      repository = MockPostApiRepository();
      response = List.generate(
        10,
        (i) => Post(title: 'Post $i', body: 'Body of Post $i'),
      );
    });

    test(
      'should return List of Post when calling getPosts api request',
      () async {
        when(repository.getPosts()).thenAnswer((_) async => response);

        var posts = await repository.getPosts();

        expect(posts, isA<List<Post>>());
        expect(response.length, posts.length);
      },
    );

    test(
      'should return Exception when calling getPosts api request',
      () async {
        var error = Exception('error occurred');

        when(repository.getPosts()).thenThrow(error);

        expect(() => repository.getPosts(), throwsException);
      },
    );

    test(
      'should return DioError when calling getPosts api request',
      () async {
        var error = DioError(requestOptions: RequestOptions(path: '/posts'));

        when(repository.getPosts()).thenThrow(error);

        try {
          await repository.getPosts();
        } catch (e) {
          expect(e, isInstanceOf<DioError>());
        }
      },
    );
  });
}
