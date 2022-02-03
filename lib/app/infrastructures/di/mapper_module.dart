import 'package:injector/injector.dart';
import 'package:soid_mobile/data/persistences/mappers/post_mapper.dart';

class MapperModule {
  static void init(Injector injector) {
    injector.registerSingleton<PostMapper>(() => PostMapper());
  }
}
