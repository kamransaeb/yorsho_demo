import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/app_localization/app_localization.dart';
import '../../core/app_theme/app_theme.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';
import '../../core/constants/assets_icons/assets_icons.dart';
import '../svg_icon.dart';

typedef CallbackFunction = void Function();

Future<bool?> showDialogByChild({
  required BuildContext context,
  String? titleTranslate,
  required List<Widget> child,
  required double width,
  required double height,
}) async {

  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.borderRadius),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(),
            ),
             if (titleTranslate != null ) Text(
              AppLocalizations.of(context)!.translate(titleTranslate)!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child:
              Container(
                color: AppTheme.whiteColor,
                alignment: Alignment.centerRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgIcon(
                        asset: AssetsIcons.arrowCloseThin,
                        size: AppDimensions.iconSizeMedium,
                      ),
                    ),
                  ),
                ),
              ),

            ),
          ],
        ),
        content: SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            child:
            Container(
              margin: const EdgeInsets.all(
                AppDimensions.pagePadding,
              ),
              child:
            ListBody(
              children: child,
            ),
          ),
        ),
        ),
      );
    },
  );
}
