import 'package:intl/intl.dart';

class Variation {
  static variationCrypto(double tdyValue, double ystValue) {
    tdyValue = tdyValue * 100;

    double variationResult = tdyValue / ystValue;

    variationResult = variationResult - 100;

    final formatedNumber = NumberFormat.currency(customPattern: "#.##",decimalDigits: 2);
    if (variationResult<0) {
      return '${formatedNumber.format(variationResult)} %';
    }
    return '+ ${formatedNumber.format(variationResult)} %';
  }
}