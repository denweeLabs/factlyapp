import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/auth/domain/entity/change_password_failure.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/constants/formatters/input_formatters.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/animated_switchers.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_keyboard_padded_body_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/widget/shared/inputs/app_input_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/page/reset_password/reset_password_page_args.dart';
import 'package:denwee/presentation/widget/auth/email_and_password_form_widget.dart';
import 'package:denwee/presentation/bloc/change_password/change_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.args});

  static const routeName = 'ResetPasswordPage';

  final ResetPasswordPageArgs args;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  static final fieldPadding = EdgeInsets.symmetric(
    vertical: 12.h,
    horizontal: 4.w,
  );

  late final TextEditingController newPasswordController =
      TextEditingController();
  late final TextEditingController confirmPasswordController =
      TextEditingController();

  late final FocusNode newPasswordFocusNode = FocusNode();
  late final FocusNode confirmPasswordFocusNode = FocusNode();

  var isConfirmPasswordFieldVisible = false;

  String get newPasswordText {
    return newPasswordController.text.trim();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      newPasswordFocusNode
        ..requestFocus()
        ..addListener(newPasswordFocusListener);
    });
  }

  void newPasswordFocusListener() {
    final hasFocus = newPasswordFocusNode.hasFocus;
    if (newPasswordText.isNotEmpty && !isConfirmPasswordFieldVisible && !hasFocus) {
      setState(() => isConfirmPasswordFieldVisible = true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    newPasswordFocusNode
      ..removeListener(newPasswordFocusListener)
      ..dispose();
    confirmPasswordFocusNode.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
      listener: (_, __) {},
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
                ? _buildPasswordResetMessage()
                : CommonKeyboardPaddedBody(
                    key: const ValueKey(false),
                    onBack: _onBack,
                    keyboardDismissAction: _dismissAction,
                    title: context.tr(LocaleKeys.label_reset_password),
                    topPadding: isConfirmPasswordFieldVisible ? 0.0 : 48.h,
                    bottomSectionPadding: AppConstants.style.padding.bottomCtaPadding(context),
                    keyboardDismissButtonColor: context.darkPrimaryContainer,
                    keyboardDismissButtonHoverColor: context.darkSecondaryContainer,
                    bottomSection: _buildResetPasswordButton(),
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
                            _buildNewPasswordField(state),
                            12.verticalSpace,
                            _buildConfirmPasswordField(state),
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

  Widget _buildNewPasswordField(ChangePasswordState state) {
    final backgroundColor = context.darkPrimaryContainer.withValues(alpha: 0.3);

    return AppInput(
      isPassword: true,
      controller: newPasswordController,
      focusNode: newPasswordFocusNode,
      onChanged: context.read<ChangePasswordCubit>().onOldPasswordChanged,
      autofillHints: const [AutofillHints.password],
      prefixIcon: AppConstants.assets.icons.lockLinear,
      hint: context.tr(LocaleKeys.input_field_hint_new_password),
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
      inputFormatters: [spaceDenyInputFormatter, emojiDenyInputFormatter],
      inError: !state.oldPassword.isPure && state.oldPassword.isNotValid,
      errorMessage: state.oldPassword.error?.errorName(context),
      onEditingComplete: confirmPasswordFocusNode.requestFocus,
      primaryDetailsColor: context.lightTextColor,
      backgroundColor: backgroundColor,
      padding: fieldPadding,
      borderRadius: EmailAndPasswordForm.fieldBorderRadius,
      prefixIconSize: EmailAndPasswordForm.fieldPrefixIconSize,
      cursorColor: context.lightIconColor,
      // hintStyle: bodyL.copyWith(
      //   color: context.lightTextColor.withValues(alpha: 0.7),
      // ),
    ).autoFadeInUp(sequencePos: 2);
  }

  Widget _buildConfirmPasswordField(ChangePasswordState state) {
    final backgroundColor = Color.lerp(context.darkPrimaryContainer, context.theme.colorScheme.primary, 0.1);

    return IgnorePointer(
      ignoring: !isConfirmPasswordFieldVisible,
      child: AppInput(
        controller: confirmPasswordController,
        focusNode: confirmPasswordFocusNode,
        onChanged: context.read<ChangePasswordCubit>().onNewPasswordChanged,
        prefixIcon: AppConstants.assets.icons.refreshLinear,
        hint: context.tr(LocaleKeys.input_field_hint_confirm_password),
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
        // hintStyle: bodyL.copyWith(
        //   color: context.lightTextColor.withValues(alpha: 0.7),
        // ),
      ).autoFadeInUp(sequencePos: 3),
    );
  }

  Widget _buildResetPasswordButton() {
    return Builder(builder: (context) {
      final isChanging = context
          .select<ChangePasswordCubit, bool>((cubit) => cubit.state.isChanging);
      return Center(
        child: SizedBox(
          width: 0.55.sw,
          child: AppSolidButton(
            onTap: _resetPassword,
            text: context.tr(LocaleKeys.button_change),
            isBusy: isChanging,
            shadowColor: Colors.black45,
            backgroundColors: [
              context.lightPrimaryContainer,
              context.lightPrimaryContainer,
            ],
            textColor: context.theme.colorScheme.primary,
          ).autoElasticIn(sequencePos: 6),
        ),
      );
    });
  }

  Widget _buildPasswordResetMessage() {
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
              context.tr(LocaleKeys.info_message_password_reset_success),
              textAlign: TextAlign.center,
              style: bodyL,
            ),
          ),
        ],
      ).autoElasticIn(sequencePos: 1),
    );
  }

  void _resetPassword() {
    if (!isConfirmPasswordFieldVisible && newPasswordText.isNotEmpty) {
      return setState(() => isConfirmPasswordFieldVisible = true);
    }
    final state = context.read<ChangePasswordCubit>().state;
    if (state.isValid) {
      if (state.oldPassword.value != state.newPassword.value) {
        HapticUtil.medium();
        return AppDialogs.showErrorSnackbar(
          description: context.tr(LocaleKeys.info_message_password_mismatch),
        );
      }
      context
          .read<ChangePasswordCubit>()
          .resetPasswordValidate(widget.args.accessToken);
    } else {
      HapticUtil.medium();
      context.read<ChangePasswordCubit>().validate(
            oldPassword: state.oldPassword.value,
            newPassword: state.newPassword.value,
          );
    }
  }

  void _dismissAction() {
    if (newPasswordText.isEmpty || isConfirmPasswordFieldVisible) return _unfocus();
    confirmPasswordFocusNode.requestFocus();
  }

  void _unfocus() {
    newPasswordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
  }

  void _onBack() {
    final state = context.read<ChangePasswordCubit>().state;
    if (state.isChanging) return;
    Navigator.of(context).pop();
  }
}
