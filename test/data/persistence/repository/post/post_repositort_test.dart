import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sfid_mobile/app/infrastructures/endpoints.dart';
import 'package:sfid_mobile/app/repositories/api/post_repository.dart';
import 'package:sfid_mobile/data/infrastructures/api_service_interface.dart';
import 'package:sfid_mobile/data/persistences/mappers/post_mapper.dart';
import 'package:sfid_mobile/data/persistences/repositories/contracts/post_repository.dart';
import 'package:sfid_mobile/domains/post_domain.dart';

import 'post_repositort_test.mocks.dart';

@GenerateMocks([ApiServiceInterface])
void main() {
  group('PostApiRepository', () {
    late String baseUrl = 'https://jsonplaceholder.typicode.com/';
    late ApiServiceInterface service;
    late PostRepository repository;
    late Endpoints endpoints;
    late List<dynamic> response;
    late PostMapper mapper;

    setUp(() {
      endpoints = Endpoints(baseUrl);
      mapper = PostMapper();
      service = MockApiServiceInterface();
      repository = PostApiRepository(service, endpoints, mapper);
      response = List.generate(
        10,
        (i) => <String, dynamic>{
          'userId': i,
          'id': 1,
          'title': 'lorem ipsum dolor',
          'body': 'lorem ipsum dolor sit amet',
        },
      );
    });

    test(
      'should return List of Post when calling getPosts api request',
      () async {
        when(
          service.invokeHttp(endpoints.posts(), RequestType.GET),
        ).thenAnswer((_) async => response);

        var posts = await repository.getPosts();

        expect(posts, isA<List<Post>>());
        expect(response.length, posts.length);
      },
    );

    test(
      'should return Exception when calling getPosts api request',
      () async {
        var error = Exception('error occurred');

        when(
          service.invokeHttp(endpoints.posts(), RequestType.GET),
        ).thenThrow(error);

        expect(() => repository.getPosts(), throwsException);
      },
    );

    test(
      'should return DioError when calling getPosts api request',
      () async {
        var error = DioError(requestOptions: RequestOptions(path: '/posts'));

        when(
          service.invokeHttp(endpoints.posts(), RequestType.GET),
        ).thenThrow(error);

        try {
          await repository.getPosts();
        } catch (e) {
          expect(e, isInstanceOf<DioError>());
        }
      },
    );
  });
}
