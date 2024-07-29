import 'package:intl/intl.dart';

bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  return emailRegex.hasMatch(email);
}

String formattedPrice(double num) {
  return NumberFormat('#,##0.00').format(num);
}

int countDigitsAfterDecimal(String numberStr) {
  int decimalIndex = numberStr.indexOf('.');

  if (decimalIndex == -1) {
    return 0;
  }

  String decimalPart = numberStr.substring(decimalIndex + 1);
  return decimalPart.length;
}
