import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/failure/change_password_failure.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/formatters/input_formatters.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animated_switchers.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_keyboard_padded_body_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/inputs/app_input_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/authentication/ui/widget/email_and_password_form_widget.dart';
import 'package:denwee/pages/account/change_password/cubit/change_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  static const routeName = 'ChangePasswordPage';

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  static final fieldPadding = EdgeInsets.symmetric(
    vertical: 12.h,
    horizontal: 4.w,
  );

  late final TextEditingController oldPasswordController =
      TextEditingController();
  late final TextEditingController newPasswordController =
      TextEditingController();

  late final FocusNode oldPasswordFocusNode = FocusNode();
  late final FocusNode newPasswordFocusNode = FocusNode();

  String get oldPasswordText {
    return oldPasswordController.text.trim();
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordFocusNode.dispose();
    newPasswordFocusNode.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
  }

  bool _listener(ChangePasswordState p, ChangePasswordState c) {
    if (p.isChanging && !c.isChanging) {
      if (c.isChangeFailure) {
        HapticUtil.medium();
        AppDialogs.showErrorSnackbar(
          title: context.tr(LocaleKeys.label_oops),
          description: c.changeFailure.toNullable()!.errorMessage(context),
        );
      } else if (c.isChangeSuccess) {
        Future.delayed(const Duration(milliseconds: 2000), _onBack);
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isChangePasswordSuccess = context
        .select((ChangePasswordCubit cubit) => cubit.state.isChangeSuccess);

    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (_, _) {},
      listenWhen: _listener,
      child: CommonPopScope(
        onWillPop: _onBack,
        child: CommonScaffold(
          systemOverlayType: ThemeType.dark,
          style: isChangePasswordSuccess
              ? CommonBackgroundStyle.themeBased
              : CommonBackgroundStyle.colored,
          systemNavigationBarContrastEnforced: false,
          body: AnimatedSwitcher(
            switchInCurve: Curves.easeInOutSine,
            switchOutCurve: Curves.easeInOutSine,
            duration: const Duration(milliseconds: 500),
            transitionBuilder: AnimatedSwitchers.fadeBlurXYTransition,
            child: isChangePasswordSuccess
                ? _buildPasswordChangedMessage()
                : CommonKeyboardPaddedBody(
                    key: const ValueKey(false),
                    onBack: _onBack,
                    keyboardDismissAction: _unfocus,
                    title: context.tr(LocaleKeys.label_change_password),
                    // topPadding: isNewPasswordFieldVisible ? 0.0 : 48.h,
                    bottomSectionPadding: AppConstants.style.padding.bottomCtaPadding(context),
                    keyboardDismissButtonColor: context.darkPrimaryContainer,
                    keyboardDismissButtonHoverColor: context.darkSecondaryContainer,
                    bottomSection: _buildChangePasswordButton(),
                    body: Theme(
                      data: context.theme.copyWith(
                        shadowColor: Colors.transparent,
                        colorScheme: context.theme.colorScheme
                            .copyWith(error: context.lightTextColor),
                      ),
                      child:
                          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                        builder: (context, state) => Column(
                          children: [
                            _buildOldPasswordField(state),
                            12.verticalSpace,
                            _buildNewPasswordField(state),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildOldPasswordField(ChangePasswordState state) {
    final backgroundColor = context.darkPrimaryContainer.withValues(alpha: 0.3);

    return AppInput(
      isPassword: true,
      controller: oldPasswordController,
      focusNode: oldPasswordFocusNode,
      onChanged: context.read<ChangePasswordCubit>().onOldPasswordChanged,
      autofillHints: const [AutofillHints.password],
      prefixIcon: AppConstants.assets.icons.refreshLinear,
      hint: context.tr(LocaleKeys.input_field_hint_old_password),
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
      inputFormatters: [spaceDenyInputFormatter, emojiDenyInputFormatter],
      inError: !state.oldPassword.isPure && state.oldPassword.isNotValid,
      errorMessage: state.oldPassword.error?.errorName(context),
      onEditingComplete: newPasswordFocusNode.requestFocus,
      primaryDetailsColor: context.lightTextColor,
      backgroundColor: backgroundColor,
      padding: fieldPadding,
      borderRadius: EmailAndPasswordForm.fieldBorderRadius,
      prefixIconSize: EmailAndPasswordForm.fieldPrefixIconSize,
      cursorColor: context.lightIconColor,
      // hintStyle: bodyL.copyWith(
      //   color: context.lightTextColor.withValues(alpha: 0.7),
      // ),
    ).autoFadeInUp(sequencePos: 3);
  }

  Widget _buildNewPasswordField(ChangePasswordState state) {
    final backgroundColor = Color.lerp(
        context.darkPrimaryContainer, context.theme.colorScheme.primary, 0.1);

    return AppInput(
      controller: newPasswordController,
      focusNode: newPasswordFocusNode,
      onChanged: context.read<ChangePasswordCubit>().onNewPasswordChanged,
      prefixIcon: AppConstants.assets.icons.lockLinear,
      hint: context.tr(LocaleKeys.input_field_hint_new_password),
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.done,
      inputFormatters: [spaceDenyInputFormatter, emojiDenyInputFormatter],
      inError: !state.newPassword.isPure && state.newPassword.isNotValid,
      errorMessage: state.newPassword.error?.errorName(context),
      isPassword: true,
      primaryDetailsColor: context.lightTextColor,
      backgroundColor: backgroundColor,
      padding: fieldPadding,
      borderRadius: EmailAndPasswordForm.fieldBorderRadius,
      prefixIconSize: EmailAndPasswordForm.fieldPrefixIconSize,
      cursorColor: context.lightIconColor,
    ).autoFadeInUp(sequencePos: 4);
  }

  Widget _buildChangePasswordButton() {
    return Builder(builder: (context) {
      final isChanging = context
          .select<ChangePasswordCubit, bool>((cubit) => cubit.state.isChanging);

      return Center(
        child: SizedBox(
          width: 0.55.sw,
          child: AppSolidButton(
            onTap: _changePassword,
            text: context.tr(LocaleKeys.button_change),
            isBusy: isChanging,
            shadowColor: Colors.black45,
            backgroundColors: [
              context.lightPrimaryContainer,
              context.lightPrimaryContainer,
            ],
            textColor: context.theme.colorScheme.primary,
          ).fadeScale(
            fades: const BiPos(0.0, 1.0),
            scales: const BiPos(0.0, 1.0),
            delay: const Duration(milliseconds: 800),
            scaleCurve: Curves.elasticOut,
          ),
        ),
      );
    });
  }

  Widget _buildPasswordChangedMessage() {
    return Center(
      key: const ValueKey(true),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonAppIcon(
            path: AppConstants.assets.icons.verifyLinear,
            color: AppColors.lightGreen,
            size: 96,
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Text(
              context.tr(LocaleKeys.info_message_password_change_success),
              textAlign: TextAlign.center,
              style: bodyL,
            ),
          ),
        ],
      ).fadeScale(
        fades: const BiPos(0.0, 1.0),
        scales: const BiPos(0.1, 1.0),
        scaleCurve: Curves.linearToEaseOut,
        delay: const Duration(milliseconds: 300),
      ),
    );
  }

  void _changePassword() {
    final state = context.read<ChangePasswordCubit>().state;
    if (state.isValid) {
      context.read<ChangePasswordCubit>().changePassword();
    } else {
      HapticUtil.medium();
      context.read<ChangePasswordCubit>().validate(
            oldPassword: state.oldPassword.value,
            newPassword: state.newPassword.value,
          );
    }
  }

  void _unfocus() {
    oldPasswordFocusNode.unfocus();
    newPasswordFocusNode.unfocus();
  }

  void _onBack() {
    final state = context.read<ChangePasswordCubit>().state;
    if (state.isChanging) return;
    Navigator.of(context).pop();
  }
}
