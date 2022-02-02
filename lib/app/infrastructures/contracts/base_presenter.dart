import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

abstract class BasePresenter<RESPONSE, PAYLOAD> extends Presenter {
  late final Function(RESPONSE?) onSuccess;
  late final Function(dynamic) onError;
  late final Function onComplete;

  late final UseCase<RESPONSE, PAYLOAD> _useCase;

  BasePresenter(this._useCase);

  void execute([PAYLOAD? payload]) {
    var observer = BaseObserver<RESPONSE>(
      onSuccess: onSuccess,
      onFinish: onComplete,
      onFailure: onError,
    );
    _useCase.execute(observer, payload);
  }

  @override
  void dispose() {
    _useCase.dispose();
  }
}

class BaseObserver<RESPONSE> implements Observer<RESPONSE> {
  late final Function(RESPONSE?) onSuccess;
  late final Function(dynamic) onFailure;
  late final Function onFinish;

  BaseObserver({
    required this.onSuccess,
    required this.onFinish,
    required this.onFailure,
  });

  @override
  void onComplete() {
    onFinish.call();
  }

  @override
  void onError(e) {
    onFailure.call(e);
  }

  @override
  void onNext(RESPONSE? response) {
    onSuccess.call(response);
  }
}
