import 'package:intl/intl.dart';

class PriceUtils {
  PriceUtils._();

  // static final value =  NumberFormat("#,##0.00", "en_US");
   static final value =  NumberFormat.currency(locale: 'tr', symbol: '');
  // static final value =  NumberFormat("#.##0,00");

  static String numberToPriceFormat(num number) => value.format(number);

  static String priceFormatToNumber(String price) => value.parse(price).toString();


  static final priceCurrencyFormat = NumberFormat.currency(
    locale: 'en-US',
    customPattern: '###,###',
    decimalDigits: 0,
  );
}