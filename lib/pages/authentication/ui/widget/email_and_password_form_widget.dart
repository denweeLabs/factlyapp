import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/formatters/input_formatters.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_loading_widget.dart';
import 'package:denwee/core/ui/widget/inputs/app_input_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPasswordForm extends StatelessWidget {
  const EmailAndPasswordForm({
    super.key,
    // email
    required this.emailController,
    required this.emailFocusNode,
    required this.onEmailChanged,
    required this.emailInError,
    required this.emailErrorMessage,

    // password
    required this.passwordController,
    required this.passwordFocusNode,
    required this.onPasswordChanged,
    required this.passwordInError,
    required this.passwordErrorMessage,
    this.onPasswordEditingComplete,
    required this.onGoogleAuth,
    required this.isGoogleAuthInProgress,
    this.onForgotPass,
    this.isForgotPassInProgress = false,
    this.showPasswordVisibilityButton = false,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final void Function(String) onEmailChanged;
  final bool emailInError;
  final String? emailErrorMessage;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final void Function(String) onPasswordChanged;
  final void Function()? onPasswordEditingComplete;
  final bool passwordInError;
  final String? passwordErrorMessage;
  final bool showPasswordVisibilityButton;
  final VoidCallback? onForgotPass;
  final bool isForgotPassInProgress;
  final VoidCallback onGoogleAuth;
  final bool isGoogleAuthInProgress;

  static const fieldBorderRadius = 18;
  static const fieldPrefixIconSize = 22;

  @override
  Widget build(BuildContext context) {
    final emailFieldBackground = Color.lerp(
      context.darkPrimaryContainer,
      context.theme.colorScheme.primary,
      0.1,
    );
    final fieldPadding = EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w);

    return Theme(
      data: context.theme.copyWith(
        shadowColor: Colors.transparent,
        colorScheme: context.theme.colorScheme.copyWith(
          error: context.lightTextColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInput(
            controller: emailController,
            focusNode: emailFocusNode,
            onChanged: onEmailChanged,
            autofillHints: const [AutofillHints.email],
            prefixIcon: AppConstants.assets.icons.userLinear,
            hint: context.tr(LocaleKeys.input_field_hint_email),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            inputFormatters: [spaceDenyInputFormatter, emojiDenyInputFormatter],
            inError: emailInError,
            errorMessage: emailErrorMessage,
            primaryDetailsColor: context.lightTextColor,
            backgroundColor: emailFieldBackground,
            padding: fieldPadding.copyWith(right: 0.0),
            borderRadius: EmailAndPasswordForm.fieldBorderRadius,
            prefixIconSize: EmailAndPasswordForm.fieldPrefixIconSize,
            // innerTrailingWidget: _buildGoogleAuthTrailing(),
          ).autoFadeInUp(sequencePos: 2),
          12.verticalSpace,
          AppInput(
            controller: passwordController,
            focusNode: passwordFocusNode,
            onChanged: onPasswordChanged,
            autofillHints: const [AutofillHints.password],
            prefixIcon: AppConstants.assets.icons.lockLinear,
            hint: context.tr(LocaleKeys.input_field_hint_password),
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            inputFormatters: [spaceDenyInputFormatter, emojiDenyInputFormatter],
            inError: passwordInError,
            errorMessage: passwordErrorMessage,
            isPassword: true,
            showPasswordVisibilityButton: false,
            onEditingComplete: onPasswordEditingComplete,
            primaryDetailsColor: context.lightTextColor,
            backgroundColor: context.darkPrimaryContainer.withValues(
              alpha: 0.1,
            ),
            padding: fieldPadding,
            borderRadius: EmailAndPasswordForm.fieldBorderRadius,
            prefixIconSize: EmailAndPasswordForm.fieldPrefixIconSize,
            cursorColor: emailFieldBackground,
            innerTrailingWidget: _buildForgotPassButton(context),
            customPasswordVisibilityIcon: !showPasswordVisibilityButton
                ? null
                : (isVisible) => _buildPassVisibilityButton(context, isVisible),
          ).autoFadeInUp(sequencePos: 3),
        ],
      ),
    );
  }

  Widget? _buildForgotPassButton(BuildContext context) {
    if (onForgotPass == null) return null;

    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: BounceTapAnimation(
        onTap: onForgotPass,
        child: SizedBox.square(
          dimension: 38.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              border: Border.all(color: context.lightSurfaceBorderColor),
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: CustomAnimationDurations.ultraLow,
                child: isForgotPassInProgress
                    ? CommonLoading(
                        size: 14,
                        color: context.lightIconColorSecondary,
                      )
                    : Text(
                        '?',
                        style: h4.copyWith(
                          color: context.lightIconColorSecondary,
                        ),
                      ),
              ),
            ),
          ),
        ).autoElasticIn(sequencePos: 4),
      ),
    );
  }

  Widget _buildPassVisibilityButton(
    BuildContext context,
    bool isPasswordVisible,
  ) {
    final iconPath = isPasswordVisible
        ? AppConstants.assets.icons.eyeLinear
        : AppConstants.assets.icons.eyeSlashLinear;

    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: BounceTapAnimation(
        onTap: onForgotPass,
        child: SizedBox.square(
          dimension: 38.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              border: Border.all(color: context.lightSurfaceBorderColor),
            ),
            child: Center(
              child: CommonAppIcon(
                path: iconPath,
                color: context.lightIconColorSecondary,
                size: 16,
              ),
            ),
          ),
        ).autoElasticIn(sequencePos: 4),
      ),
    );
  }

  /*
  Widget _buildGoogleAuthTrailing() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        10.horizontalSpace,
        Container(
          width: 1.0,
          height: 30.h,
          color: Colors.white30,
        ),
        FadeLoopAnimation(
          enabled: isGoogleAuthInProgress,
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 1000),
          child: BounceTapAnimation(
            onTap: onGoogleAuth,
            child: Padding(
              padding: EdgeInsets.only(right: 14.w, left: 10.w),
              child: SvgPicture.asset(
                AppConstants.assets.icons.google,
                height: 30.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
  */
}
