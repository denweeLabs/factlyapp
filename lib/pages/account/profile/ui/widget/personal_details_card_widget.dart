import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/formatters/input_formatters.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/inputs/app_input_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsCard extends StatelessWidget {
  const PersonalDetailsCard({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    required this.onNameChanged,
    required this.nameErrorMessage,
    required this.nameInError,
    required this.emailController,
    required this.emailFocusNode,
    required this.onEmailChanged,
    required this.emailErrorMessage,
    required this.emailInError,
    required this.isFormValid,
  });

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final ValueChanged<String> onNameChanged;
  final String? nameErrorMessage;
  final bool nameInError;

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final ValueChanged<String> onEmailChanged;
  final String? emailErrorMessage;
  final bool emailInError;

  final bool isFormValid;

  @override
  Widget build(BuildContext context) {
    final decorationIcon = (nameInError || emailInError) && !isFormValid
        ? AppConstants.assets.icons.alertLinear
        : AppConstants.assets.icons.editBoxLinear;

    return DecoratedBox(
      decoration: ShapeDecoration(
        gradient: AppConstants.style.colors.commonColoredGradient(context),
        shadows: [AppConstants.style.colors.commonColoredShadow(context)],
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.all(AppConstants.style.radius.card),
          side: const BorderSide(color: Colors.white12),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -12.w,
            bottom: -16.h,
            child: AnimatedSwitcherPlus.zoomIn(
              duration: CustomAnimationDurations.lowMedium,
              switchInCurve: Curves.easeInOutSine,
              switchOutCurve: Curves.easeInOutSine,
              child: CommonAppIcon(
                path: decorationIcon,
                key: ValueKey(decorationIcon),
                color: context.darkIconColor.withValues(alpha: .08),
                size: 98,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppInput(
                  hintStyle: textFieldHint.copyWith(color: context.lightTextColor),
                  focusNode: nameFocusNode,
                  controller: nameController,
                  hint: context.tr(LocaleKeys.account_profile_default_username),
                  prefixIcon: AppConstants.assets.icons.userSquareLinear,
                  primaryDetailsColor: context.lightTextColor,
                  cursorColor: context.lightTextColor,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  onChanged: onNameChanged,
                  onlyInputField: true,
                ),
                6.verticalSpace,
                Container(
                  height: 0.8,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                  color: context.lightIconColor.withValues(alpha: 0.15),
                ),
                6.verticalSpace,
                AppInput(
                  hintStyle: textFieldHint.copyWith(color: context.lightTextColor),
                  focusNode: emailFocusNode,
                  controller: emailController,
                  hint: context.tr(LocaleKeys.input_field_hint_email),
                  prefixIcon: AppConstants.assets.icons.smsLinear,
                  primaryDetailsColor: context.lightTextColor,
                  cursorColor: context.lightTextColor,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  onChanged: onEmailChanged,
                  onlyInputField: true,
                  inputFormatters: [spaceDenyInputFormatter, emojiDenyInputFormatter],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppInput.buildErrorMessage(
                        context,
                        nameInError,
                        '• ${nameErrorMessage ?? ''}',
                        padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                        forcedColor: context.lightTextColor,
                      ),
                      AppInput.buildErrorMessage(
                        context,
                        emailInError,
                        '• ${emailErrorMessage ?? ''}',
                        padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                        forcedColor: context.lightTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
