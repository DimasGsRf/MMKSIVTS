import 'package:injector/injector.dart';
import 'package:mmksi_vts_mobile/app/ui/pages/post/presenter.dart';

class PresenterModule {
  static void init(Injector injector) {
    injector.registerDependency<PostsPresenter>(
      () => PostsPresenter(injector.get()),
    );
  }
}
