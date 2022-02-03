import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mmksi_vts_mobile/app/repositories/api/post_repository.dart';
import 'package:mmksi_vts_mobile/domains/post_domain.dart';
import 'package:mmksi_vts_mobile/use_cases/post/get_posts_use_case.dart';

import 'get_posts_use_case_test.mocks.dart';

@GenerateMocks([PostApiRepository])
void main() {
  group('GetPostsUseCase', () {
    late MockPostApiRepository repository;
    late GetPostsUseCase useCase;

    setUp(() {
      repository = MockPostApiRepository();
      useCase = GetPostsUseCase(repository);
    });

    test('Should return List of Post when executing use case', () async {
      var posts = List.generate(10, (_) => Post(title: 'title', body: 'body'));
      var observer = _SuccessObserver();

      when(repository.getPosts()).thenAnswer((_) async => posts);

      useCase.execute(observer);
    });

    test('Should return Empty List of Post when executing use case', () async {
      var posts = <Post>[];
      var observer = _EmptyObserver();

      when(repository.getPosts()).thenAnswer((_) async => posts);

      useCase.execute(observer);
    });

    test('Should return Null when executing use case', () async {
      var posts;
      var observer = _NullObserver();

      when(repository.getPosts()).thenAnswer((_) async => posts);

      useCase.execute(observer);
    });

    test('Should return Exception when executing use case', () async {
      var exception = Exception('Error ocurred');
      var observer = _ErrorObserver();

      when(repository.getPosts()).thenThrow(exception);

      useCase.execute(observer);
    });

    test('Should return DioError when executing use case', () async {
      var exception = DioError(requestOptions: RequestOptions(path: '/posts'));
      var observer = _DioErrorObserver();

      when(repository.getPosts()).thenThrow(exception);

      useCase.execute(observer);
    });
  });
}

abstract class _Observer implements Observer<List<Post>> {
  @override
  void onComplete() {}

  @override
  void onError(e) {}

  @override
  void onNext(List<Post>? response) {}
}

class _SuccessObserver extends _Observer {
  @override
  void onNext(List<Post>? response) {
    expect(response, isNotNull);
    expect(response?.isNotEmpty, true);
  }
}

class _EmptyObserver extends _Observer {
  @override
  void onNext(List<Post>? response) {
    expect(response?.isNotEmpty, false);
  }
}

class _NullObserver extends _Observer {
  @override
  void onNext(List<Post>? response) {
    expect(response, isNull);
  }
}

class _ErrorObserver extends _Observer {
  @override
  void onError(e) {
    expect(e, isInstanceOf<Exception>());
  }
}

class _DioErrorObserver extends _Observer {
  @override
  void onError(e) {
    expect(e, isInstanceOf<DioError>());
  }
}
