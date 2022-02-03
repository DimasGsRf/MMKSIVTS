import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:mmksi_vts_mobile/app/infrastructures/contracts/base_controller.dart';

abstract class BaseWidget<Con extends BaseController> extends View {
  final Con _controller;

  BaseWidget(this._controller, {Key? key});

  Widget get view;

  @override
  State<StatefulWidget> createState() => _BaseWidgetState<Con>(
        _controller,
        view,
      );
}

class _BaseWidgetState<Con extends BaseController>
    extends ViewState<BaseWidget<Con>, Con> {
  final Widget _view;

  _BaseWidgetState(Con controller, this._view) : super(controller);

  @override
  Widget get view => _view;
}
