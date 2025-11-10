import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../core/constants/assets_icons/assets_icons.dart';
import '../../../../../widgets/buttons/custom_icon_button.dart';
import '../../../../../widgets/my_date_time_picker/my_date_time_picker_theme.dart';
import '../../../../../widgets/my_date_time_picker/my_date_time_picker.dart';
import '../../../../../widgets/svg_icon.dart';
import '../../../../app/presentation/bloc/app_bloc.dart';
import '../../bloc/home_birth_date/home_birth_date_bloc.dart';

class HomeBirthDateCupertinoPicker extends StatelessWidget {
  const HomeBirthDateCupertinoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    String languageCode = context.read<AppBloc>().state.locale;
    DateTimePickerLocale dateTimePickerLocale = DATETIME_PICKER_LOCALE_DEFAULT;
    if (languageCode == 'en') {
      dateTimePickerLocale = DateTimePickerLocale.en_us;
    } else if (languageCode == 'tr') {
      dateTimePickerLocale = DateTimePickerLocale.tr;
    }

    AppScale scale = AppScale(context);

    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 0.30,
          child: Container(
            height: scale.pagePadding / 4,
            decoration: BoxDecoration(
              color: AppTheme.greyColor3,
              borderRadius:
                  BorderRadius.all(Radius.circular(scale.pagePadding * 2)),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                //child: Text(""),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                child: CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const SvgIcon(
                    asset: AssetsIcons.arrowDone,
                    color: AppTheme.iconColor,
                    size: AppDimensions.iconSizeLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          // child: SingleChildScrollView(
          // padding: EdgeInsets.zero,
          child: Center(
            child: MyDateTimePicker(
              looping: false,
              // default is not looping
              lastDate: DateTime(DateTime.now().year - 10),
              //initialDate: DateTime(DateTime.now().year - 10),
              initialDate: context.read<HomeBirthDateBloc>().state.birthDate,
              firstDate: DateTime(DateTime.now().year - 100),
              dateFormat: "dd-MMMM-yyyy",
              locale: dateTimePickerLocale,
              onChange: (DateTime newDate, _) {
                DateTime birthDate = DateTime.parse(newDate.toIso8601String());

                context.read<HomeBirthDateBloc>().add(
                      HomeBirthDateEventBirthDateChanged(
                        birthDate: DateTime(
                            birthDate.year, birthDate.month, birthDate.day, 12),
                      ),
                    );
              },
              pickerTheme: MyDateTimePickerTheme(
                //pickerHeight: cupertinoPickerHeight * 2,
                pickerHeight: scale.width,
                itemTextStyle: Theme.of(context).textTheme.titleMedium!,
                dividerColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
