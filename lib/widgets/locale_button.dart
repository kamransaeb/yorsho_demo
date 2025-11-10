import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/app_scale/app_scale.dart';
import '../core/app_theme/app_theme.dart';
import '../core/constants/app_dimensions/app_dimensions.dart';
import '../features/app/presentation/bloc/app_bloc.dart';

class LocaleButton extends StatelessWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context) {

    AppScale scale = AppScale(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: scale.pagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => context
                .read<AppBloc>()
                .add(const AppEventLocaleChanged(locale: 'tr')),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: scale.pagePadding / 2, vertical: scale.pagePadding / 4),
              decoration: BoxDecoration(
                border: Border.all(
                  width: AppDimensions.borderLineWidth,
                  color: AppTheme.textColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppDimensions.borderRadius * 2),
                ),
                color: context.select((AppBloc bloc) => bloc.state.locale) == 'tr'
                    ? AppTheme.textColor
                    : AppTheme.whiteColor,
              ),
              child: Text(
                'TR',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                  context.select((AppBloc bloc) => bloc.state.locale) ==
                      'tr'
                      ? AppTheme.whiteColor
                      : AppTheme.textColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: scale.pagePadding / 4,
          ),
          GestureDetector(
            onTap: () => context
                .read<AppBloc>()
                .add(const AppEventLocaleChanged(locale: 'en')),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: scale.pagePadding / 2, vertical: scale.pagePadding / 4),
              decoration: BoxDecoration(
                border: Border.all(
                  width: AppDimensions.borderLineWidth,
                  color: AppTheme.textColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppDimensions.borderRadius * 2),
                ),
                color: context.select((AppBloc bloc) => bloc.state.locale) == 'en'
                    ? AppTheme.textColor
                    : AppTheme.whiteColor,
              ),
              child: Text(
                'EN',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                  context.select((AppBloc bloc) => bloc.state.locale) ==
                      'en'
                      ? AppTheme.whiteColor
                      : AppTheme.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
