// Mocks generated by Mockito 5.0.10 from annotations
// in sfid_mobile/test/app/ui/pages/post/presenter.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_clean_architecture/src/observer.dart' as _i6;
import 'package:logging/src/logger.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mmksi_vts_mobile/domains/post_domain.dart' as _i5;
import 'package:mmksi_vts_mobile/use_cases/post/get_posts_use_case.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeLogger extends _i1.Fake implements _i2.Logger {}

/// A class which mocks [GetPostsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPostsUseCase extends _i1.Mock implements _i3.GetPostsUseCase {
  MockGetPostsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Logger get logger => (super.noSuchMethod(Invocation.getter(#logger),
      returnValue: _FakeLogger()) as _i2.Logger);
  @override
  _i4.Future<List<_i5.Post>> getData(dynamic _) =>
      (super.noSuchMethod(Invocation.method(#getData, [_]),
              returnValue: Future<List<_i5.Post>>.value(<_i5.Post>[]))
          as _i4.Future<List<_i5.Post>>);
  @override
  _i4.Future<_i4.Stream<List<_i5.Post>?>> buildUseCaseStream(dynamic params) =>
      (super.noSuchMethod(Invocation.method(#buildUseCaseStream, [params]),
              returnValue: Future<_i4.Stream<List<_i5.Post>?>>.value(
                  Stream<List<_i5.Post>?>.empty()))
          as _i4.Future<_i4.Stream<List<_i5.Post>?>>);
  @override
  void execute(_i6.Observer<List<_i5.Post>>? observer, [dynamic params]) =>
      super.noSuchMethod(Invocation.method(#execute, [observer, params]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [Observer].
///
/// See the documentation for Mockito's code generation for more information.
class MockObserver<T> extends _i1.Mock implements _i6.Observer<T> {
  MockObserver() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void onNext(T? response) =>
      super.noSuchMethod(Invocation.method(#onNext, [response]),
          returnValueForMissingStub: null);
  @override
  void onComplete() => super.noSuchMethod(Invocation.method(#onComplete, []),
      returnValueForMissingStub: null);
  @override
  void onError(dynamic e) =>
      super.noSuchMethod(Invocation.method(#onError, [e]),
          returnValueForMissingStub: null);
}
