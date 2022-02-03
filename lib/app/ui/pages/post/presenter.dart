import 'package:mmksi_vts_mobile/app/infrastructures/contracts/base_presenter.dart';
import 'package:mmksi_vts_mobile/domains/post_domain.dart';
import 'package:mmksi_vts_mobile/use_cases/post/get_posts_use_case.dart';

class PostsPresenter extends BasePresenter<List<Post>, dynamic> {
  PostsPresenter(GetPostsUseCase useCase) : super(useCase);

  void onGetPosts() {
    execute();
  }
}
