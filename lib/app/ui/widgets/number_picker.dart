import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  final int initalValue, maxValue;
  final ValueChanged<int> onChanged;

  const NumberPickerWidget(
      {Key? key,
      required this.initalValue,
      required this.maxValue,
      required this.onChanged})
      : super(key: key);

  @override
  _NumberPickerWidgetState createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  late int _currentValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _currentValue = widget.initalValue;
  }

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 1,
      maxValue: widget.maxValue,
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
        });

        widget.onChanged(value);
      },
    );
  }
}
