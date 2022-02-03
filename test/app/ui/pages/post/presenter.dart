import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:soid_mobile/app/ui/pages/post/presenter.dart';
import 'package:soid_mobile/domains/post_domain.dart';
import 'package:soid_mobile/use_cases/post/get_posts_use_case.dart';

import 'presenter.mocks.dart';

@GenerateMocks([GetPostsUseCase, Observer])
void main() {
  group('PostsPresenter', () {
    late PostsPresenter presenter;
    late GetPostsUseCase useCase;
    late Observer<List<Post>> observer;

    setUp(() {
      observer = MockObserver();
      useCase = MockGetPostsUseCase();
      presenter = PostsPresenter(useCase);
    });

    test('Should return null when checking observer', () {
      expect(presenter.onComplete, isNull);
      expect(presenter.onSuccess, isNull);
      expect(presenter.onError, isNull);
    });

    test('Should return not null when checking observer', () {
      presenter.onComplete = () {};
      presenter.onError = (e) {};
      presenter.onSuccess = (posts) {};

      expect(presenter.onComplete, isNotNull);
      expect(presenter.onSuccess, isNotNull);
      expect(presenter.onError, isNotNull);
    });

    test(
        'Should call dispose from use case when calling dispose from presenter',
        () {
      var dispose = () {};

      when(useCase.dispose()).thenAnswer((_) => dispose);

      presenter.dispose();

      verify(dispose).called(1);
    });

    test(
        'Should call execute from use case when calling getposts from presenter',
        () {
      presenter.onComplete = () {};
      presenter.onError = (e) {};
      presenter.onSuccess = (posts) {};

      var execute = () {};

      when(useCase.execute(observer)).thenAnswer((_) => execute);

      presenter.onGetPosts();

      verify(execute).called(1);
    });
  });
}
