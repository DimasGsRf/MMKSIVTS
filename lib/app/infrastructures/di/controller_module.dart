import 'package:injector/injector.dart';
import 'package:soid_mobile/app/ui/pages/post/controller.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<PostsController>(
      () => PostsController(injector.get()),
    );
  }
}
