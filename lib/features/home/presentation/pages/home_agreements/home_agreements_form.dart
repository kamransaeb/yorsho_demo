import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_localization/app_localization.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../../../../widgets/box_shadow.dart';
import '../../../../../widgets/buttons/custom_elevated_button.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/custom_linear_percent_indicator.dart';
import '../../../../app/presentation/bloc/app_bloc.dart';
import '../../bloc/home_agreements/home_agreements_bloc.dart';

class HomeAgreementsForm extends StatelessWidget {
  final UserYorshoEntity userYorshoEntity;

  HomeAgreementsForm({required this.userYorshoEntity, super.key});

  final TextEditingController kvkkPrivacyPolicyController =
      TextEditingController();
  final TextEditingController userConsentConfirmationFormController =
      TextEditingController();
  final TextEditingController readAndUnderstoodController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAgreementsBloc, HomeAgreementsState>(
      builder: (context, state) {
        if (state.homeAgreementsStatus == HomeAgreementsStatus.loading) {
          return const Center(child: CustomCircularProgressIndicator());
        }
        if (state.homeAgreementsStatus == HomeAgreementsStatus.failure) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.translate(state.failure.message!)!,
            ),
          );
        }
        if (state.homeAgreementsStatus == HomeAgreementsStatus.success) {
          return _buildBody(context);
        }
        return const SizedBox(height: 0);
      },
    );
  }

  _buildBody(BuildContext context) {
    AppScale scale = AppScale(context);

    if (context.read<AppBloc>().state.locale == 'en') {
      kvkkPrivacyPolicyController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .kvkkPrivacyPolicyEn;
      userConsentConfirmationFormController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .userConsentConfirmationFormEn;
    } else {
      kvkkPrivacyPolicyController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .kvkkPrivacyPolicyTr;
      userConsentConfirmationFormController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .userConsentConfirmationFormTr;
    }
    readAndUnderstoodController.text = AppLocalizations.of(
      context,
    )!.translate('read_and_understood')!;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
          child: _buildTop(context),
        ),
        SizedBox(height: scale.pagePadding),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: scale.pagePadding),
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: _buildCenter(context),
              ),
            ),
          ),
        ),
        _buildBottom(context),
      ],
    );
  }

  _buildTop(BuildContext context) {
    AppScale scale = AppScale(context);

    return const CustomLinearPercentIndicator(percent: 5 / 5);
  }

  _buildCenter(BuildContext context) {
    AppScale scale = AppScale(context);

    if (context.read<AppBloc>().state.locale == 'en') {
      kvkkPrivacyPolicyController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .kvkkPrivacyPolicyEn;
      userConsentConfirmationFormController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .userConsentConfirmationFormEn;
    } else {
      kvkkPrivacyPolicyController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .kvkkPrivacyPolicyTr;
      userConsentConfirmationFormController.text = context
          .read<HomeAgreementsBloc>()
          .state
          .userConsentConfirmationFormTr;
    }

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: scale.pagePadding),
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.translate('kvkk_privacy_policy')!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          height: scale.width / 2,
          decoration: BoxDecoration(
            //color: greenColor,
            border: Border.all(
              color: AppTheme.primaryColor,
              width: AppDimensions.borderLineWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.borderRadius),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(scale.pagePadding / 2),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      kvkkPrivacyPolicyController.text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        _kvkkPrivacyPolicyCheckbox(context),
        SizedBox(height: scale.pagePadding / 2),
        Container(
          padding: EdgeInsets.only(bottom: scale.pagePadding),
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(
              context,
            )!.translate('user_consent_confirmation_form')!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          height: scale.width / 2,
          decoration: BoxDecoration(
            //color: greenColor,
            border: Border.all(
              color: AppTheme.primaryColor,
              width: AppDimensions.borderLineWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.borderRadius),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(scale.pagePadding / 2),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      userConsentConfirmationFormController.text,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        _userConsentConfirmationFormCheckbox(context),
      ],
    );
  }

  _kvkkPrivacyPolicyCheckbox(BuildContext context) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: AppTheme.greyColor4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(
              color: AppTheme.greyColor,
              width: AppDimensions.borderLineWidth,
            ),
            checkColor: Colors.white,
            activeColor: AppTheme.primaryColor,
            hoverColor: AppTheme.primaryColor,
            focusColor: AppTheme.primaryColor,
            // value: widget.surveyQuestionSelect.answersSelected![index],
            value: context.select(
              (HomeAgreementsBloc bloc) => bloc.state.isKvkkPrivacyPolicyAgreed,
            ),
            onChanged: (bool? value) {
              context.read<HomeAgreementsBloc>().add(
                HomeAgreementsEventKvkkPrivacyPolicyAgreed(
                  isKvkkPrivacyPolicyAgreed: value!,
                ),
              );
            },
          ),
          Expanded(
            child: TextFormField(
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor),
              // style: textStyle(context).bodyText2!.copyWith(color: greyColor),
              decoration: const InputDecoration(border: InputBorder.none),
              maxLines: 100,
              minLines: 1,
              readOnly: true,
              controller: readAndUnderstoodController,
            ),
          ),
        ],
      ),
    );
  }

  _userConsentConfirmationFormCheckbox(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: const BorderSide(
            color: AppTheme.greyColor,
            width: AppDimensions.borderLineWidth,
          ),
          checkColor: Colors.white,
          activeColor: AppTheme.primaryColor,
          hoverColor: AppTheme.primaryColor,
          focusColor: AppTheme.primaryColor,
          value: context.select(
            (HomeAgreementsBloc bloc) =>
                bloc.state.isUserConsentConfirmationFormAgreed,
          ),
          // widget.surveyQuestionSelect.answersSelected![index],
          onChanged: (bool? value) {
            context.read<HomeAgreementsBloc>().add(
              HomeAgreementsEventUserConsentConfirmationFormAgreed(
                isUserConsentConfirmationFormAgreed: value!,
              ),
            );
          },
        ),
        Expanded(
          child: TextFormField(
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppTheme.greyColor),
            decoration: const InputDecoration(border: InputBorder.none),
            maxLines: 100,
            minLines: 1,
            readOnly: true,
            controller: readAndUnderstoodController,
          ),
        ),
      ],
    );
  }

  _buildBottom(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: scale.pagePadding / 2),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_buildSaveButton(context)],
        ),
      ),
    );
  }

  _buildSaveButton(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.center,
      height: AppDimensions.buttonHeight,
      margin: EdgeInsets.only(
        left: scale.pagePadding,
        right: scale.pagePadding,
        bottom: scale.pagePadding / 2,
        // bottom: _scale.pagePadding/2,
      ),
      child: CustomElevatedButton(
        color: AppTheme.primaryColor,
        key: const Key('homeAgreementForm_saveButton_elevatedButton'),
        onPressed:
            (context.select((HomeAgreementsBloc bloc) => bloc.state).isValid)
            ? () => context.read<HomeAgreementsBloc>().add(
                const HomeAgreementsEventAgreementsCompleted(),
              )
            : null,
        child: Text(
          AppLocalizations.of(context)!.translate('save')!,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: AppTheme.whiteColor),
        ),
      ),
    );
  }
}
