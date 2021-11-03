import 'package:injector/injector.dart';
import 'package:sfid_mobile/use_cases/post/get_posts_use_case.dart';

class UseCaseModule {
  static void init(Injector injector) {
    injector.registerDependency<GetPostsUseCase>(
      () => GetPostsUseCase(injector.get()),
    );
  }
}
