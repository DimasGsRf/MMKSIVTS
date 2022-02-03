import 'package:flutter/material.dart';
import 'package:soid_mobile/app/misc/constants.dart';

class SimpleTextInput extends StatelessWidget {
  final bool? enabled, readOnly, isError;
  final String? errorText, placeholder, labelText;
  final TextEditingController? _controller;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? outerPadding;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const SimpleTextInput(
      {Key? key,
      TextEditingController? controller,
      this.keyboardType,
      this.enabled = true,
      this.readOnly = false,
      this.isError = false,
      this.labelText,
      this.errorText,
      this.outerPadding,
      this.placeholder})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: outerPadding,
      child: Column(
        children: <Widget>[
          if ((labelText?.isNotEmpty ?? false) || labelText != null)
            Container(
              padding: EdgeInsets.only(bottom: 5, top: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                labelText ?? "",
                style: TextStyle(fontSize: 15),
              ),
            ),
          TextFormField(
            keyboardType: keyboardType,
            controller: _controller,
            style: TextStyle(
                color: enabled ?? false
                    ? Colors.black
                    : AppConstants.COLOR_DISABLED_TEXT),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                hintText: placeholder,
                disabledBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: new BorderSide(
                        color: isError ?? false
                            ? AppConstants.COLOR_RED
                            : Colors.grey,
                        width: 1.0)),
                filled: enabled,
                fillColor: Colors.white,
                errorText: errorText),
            readOnly: readOnly ?? false,
            enabled: enabled,
          )
        ],
      ),
    );
  }
}
