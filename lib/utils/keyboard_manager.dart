import 'package:flutter/cupertino.dart';

class KeyboardManager {
  KeyboardManager._();

  static void closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    //**** if there was a problem with the other one
    // WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
      //FocusManager.instance.primaryFocus.
    }
  }
}