import 'package:soid_mobile/app/infrastructures/contracts/base_presenter.dart';
import 'package:soid_mobile/domains/post_domain.dart';
import 'package:soid_mobile/use_cases/post/get_posts_use_case.dart';

class PostsPresenter extends BasePresenter<List<Post>, dynamic> {
  PostsPresenter(GetPostsUseCase useCase) : super(useCase);

  void onGetPosts() {
    execute();
  }
}
