import 'package:jiffy/jiffy.dart';

Future<void> changeJiffyLocale(String locale) async {
  if (locale == 'en') {
    await Jiffy.setLocale('en');
  } else if (locale == 'tr') {
    await Jiffy.setLocale('tr');
  }
}