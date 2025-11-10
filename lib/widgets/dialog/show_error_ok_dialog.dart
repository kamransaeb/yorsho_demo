import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_localization/app_localization.dart';
import '../../core/app_scale/app_scale.dart';
import '../../core/app_theme/app_theme.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';
import '../../core/constants/assets_icons/assets_icons.dart';
import '../box_shadow.dart';
import '../svg_icon.dart';

Future<void> showErrorOkDialog({
  required BuildContext context,
  required String title,
  String? message,
  required bool isOk,
}) async {
  AppScale scale = AppScale(context);

  bool? result = await showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.borderRadius),
          ),
        ),
        title: Row(
          children: [
            Expanded(child: Container()),
            Text(
              AppLocalizations.of(context)!.translate(title)!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Container(
                //margin: EdgeInsets.only(right: AppDimensions.pagePadding / 2),
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
          height: scale.width / 2,
          width: scale.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  (isOk) ? AssetsIcons.dialogOk : AssetsIcons.dialogError,
                  height: AppDimensions.iconSizeExtraExtraLarge,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!,
                ),
              ),
              (message == null)
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(AppDimensions.pagePadding),
                      alignment: Alignment.center,
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ),
            ],
          ),
        ),
      );
    },
  );
}
