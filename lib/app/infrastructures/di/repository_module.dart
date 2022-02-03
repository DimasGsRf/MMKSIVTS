import 'package:injector/injector.dart';
import 'package:mmksi_vts_mobile/app/repositories/api/post_repository.dart';
import 'package:mmksi_vts_mobile/data/persistences/repositories/contracts/post_repository.dart';

class RepositoryModule {
  static void init(Injector injector) {
    injector.registerDependency<PostRepository>(
      () => PostApiRepository(
        injector.get(),
        injector.get(),
        injector.get(),
      ),
    );
  }
}
