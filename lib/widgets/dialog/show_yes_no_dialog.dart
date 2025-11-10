import 'package:flutter/material.dart';
import '../../core/app_localization/app_localization.dart';
import '../../core/app_scale/app_scale.dart';
import '../../core/app_theme/app_theme.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';
import '../../core/constants/assets_icons/assets_icons.dart';
import '../buttons/custom_elevated_button.dart';
import '../buttons/custom_outlined_button.dart';
import '../svg_icon.dart';

typedef CallbackFunction = void Function();

Future<bool?> showYesNoDialog(
    {required BuildContext context,
      required String titleTranslate,
      String? topTextTranslate,
      String? bottomTextTranslate,
      required bool translate,
      required bool reverse,}
    ) async {
  AppScale scale = AppScale(context);

  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.borderRadius),
          ),
        ),
        title: Row(
          children: [
            Expanded(child: Container()),
            Text(
              (translate)
                  ? AppLocalizations.of(context)!.translate(titleTranslate)!
                  : titleTranslate,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.circularBorderRadius,
                    ),
                    //boxShadow: [shadow()],
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () => Navigator.pop(context),
                    icon: const SvgIcon(
                      asset: AssetsIcons.arrowClose,
                      size: AppDimensions.iconSizeMedium,
                      color: AppTheme.iconColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: scale.width,
          height: scale.width / 2,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                (topTextTranslate == null)
                    ? const Text('')
                    : Column(
                  children: [
                    const SizedBox(height: AppDimensions.pagePadding),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        (translate)
                            ? AppLocalizations.of(
                          context,
                        )!.translate(topTextTranslate)!
                            : topTextTranslate,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.pagePadding),
                  ],
                ),
                (bottomTextTranslate == null)
                    ? const Text('')
                    : Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        (translate)
                            ? AppLocalizations.of(
                          context,
                        )!.translate(bottomTextTranslate)!
                            : bottomTextTranslate,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.pagePadding),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          (reverse)
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (reverse)
                Container(
                  alignment: Alignment.center,
                  height: AppDimensions.buttonHeight,
                  child: CustomOutlinedButton(
                    minimumSize: false,
                    outlineColor: AppTheme.textColor,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate('no')!,
                      style: Theme.of(context).textTheme.titleSmall!
                          .copyWith(color: AppTheme.textColor),
                    ),
                  ),
                ),

              Container(
                alignment: Alignment.center,
                height: AppDimensions.buttonHeight,
                child: CustomElevatedButton(
                  minimumSize: false,
                  color: AppTheme.redColor,
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    AppLocalizations.of(context)!.translate('yes')!,
                    style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(color: AppTheme.whiteColor),
                  ),
                ),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: AppDimensions.buttonHeight,
                child: CustomOutlinedButton(
                  minimumSize: false,
                  outlineColor: AppTheme.redColor,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('no')!,
                    style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(color: AppTheme.redColor),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                height: AppDimensions.buttonHeight,
                child: CustomElevatedButton(
                  minimumSize: false,
                  color: AppTheme.textColor,
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    AppLocalizations.of(context)!.translate('yes')!,
                    style: Theme.of(context).textTheme.titleSmall!
                        .copyWith(color: AppTheme.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
