import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:sfid_mobile/domains/post_domain.dart';
import 'package:sfid_mobile/use_cases/post/get_posts_use_case.dart';

class PostsPresenter extends Presenter {
  final GetPostsUseCase _useCase;

  late Function(List<Post>?) onSuccess;
  late Function onComplete;
  late Function onError;

  PostsPresenter(this._useCase);

  void onGetPosts() {
    _useCase.execute(_PostsObserver(this));
  }

  @override
  void dispose() {
    _useCase.dispose();
  }
}

class _PostsObserver implements Observer<List<Post>> {
  PostsPresenter _presenter;

  _PostsObserver(this._presenter);

  void onComplete() {
    _presenter.onComplete();
  }

  void onError(e) {
    _presenter.onError(e);
  }

  @override
  void onNext(List<Post>? response) {
    _presenter.onSuccess(response);
  }
}
