import 'package:intl/intl.dart';

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

bool identityKTPRegex(String value) {
  if (value == "") return false;
  final regExp = RegExp(
      r'(^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$)');
  return regExp.hasMatch(value);
}

bool isAdult(String birthDateString) {
  String datePattern = "dd-MM-yyyy";
  DateTime today = DateTime.now();
  DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

  DateTime adultDate = DateTime(
    birthDate.year + 17,
    birthDate.month,
    birthDate.day,
  );
  return adultDate.isBefore(today);
}
