import 'package:sfid_mobile/app/infrastructures/contracts/base_controller.dart';
import 'package:sfid_mobile/app/ui/pages/post/presenter.dart';
import 'package:sfid_mobile/domains/post_domain.dart';

class PostsController extends BaseController {
  final PostsPresenter _presenter;

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  PostsController(this._presenter);

  @override
  void initListeners() {
    super.initListeners();

    _initPostObserver();
    _loadPosts();
  }

  void _loadPosts() {
    showLoading();

    _presenter.onGetPosts();
  }

  void _initPostObserver() {
    _presenter.onError = (e) {};
    _presenter.onComplete = () {
      dismissLoading();
    };
    _presenter.onSuccess = (posts) {
      _posts = posts ?? [];
    };
  }
}
