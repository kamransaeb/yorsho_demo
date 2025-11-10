import 'dart:js' as js;
import 'package:flutter/foundation.dart';

class ClearBrowserHistory {
  ClearBrowserHistory._();

  static Future<void> clear() async {
    js.context.callMethod('clearBrowserHistory', [
      kDebugMode
          ? "http://localhost:1234" // can set your customized port
          : "https://ea2.dev" // can set your customized web page
    ]);
  }


}