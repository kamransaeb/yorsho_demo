import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/app_localization/app_localization.dart';
import '../../core/app_scale/app_scale.dart';
import '../../utils/url_launcher_utils.dart';
import '../../core/constants/app_dimensions/app_dimensions.dart';

Future<void> showUpdateAppDialog(BuildContext context, String messageTranslate,
    String updateAppAsset, String updateAppUrl) async {
  AppScale scale = AppScale(context);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(scale.pagePadding * 2),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.translate('app_update')!,
                  style: Theme.of(context).textTheme.titleLarge!,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: scale.pagePadding,
              ),
              GestureDetector(
                onTap: () => UrlLauncherUtils.openUrl(updateAppUrl),
                //_updateButton(updateAppUrl),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: scale.pagePadding, right: scale.pagePadding),
                  child: SvgPicture.asset(
                    updateAppAsset,
                    height: AppDimensions.iconSizeExtraLarge,
                    // color: redColor,
                  ),
                ),
              ),
              SizedBox(
                height: scale.pagePadding,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: scale.pagePadding),
                width: scale.width,
                child: Text(
                  AppLocalizations.of(context)!.translate(messageTranslate)!,
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


