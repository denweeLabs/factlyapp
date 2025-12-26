import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/ui/bloc/connectivity_cubit/connectivity_cubit.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_right.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_text_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_keyboard_padded_body_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:denwee/pages/authentication/ui/cubit/authentication_page_cubit.dart';
import 'package:denwee/pages/authentication/ui/register/cubit/register_cubit.dart';
import 'package:denwee/pages/authentication/ui/widget/agree_to_terms_hint_widget.dart';
import 'package:denwee/pages/authentication/ui/widget/email_and_password_form_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.hideLoginButton});

  final bool hideLoginButton;

  static const routeName = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<RegisterCubit>().state;
      if (state.email.value.isNotEmpty) {
        emailController.text = state.email.value;
      }
      if (state.password.value.isNotEmpty) {
        passwordController.text = state.password.value;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      systemOverlayType: ThemeType.dark,
      style: CommonBackgroundStyle.coloredReversed,
      systemNavigationBarContrastEnforced: false,
      body: CommonKeyboardPaddedBody(
        keyboardDismissAction: _unfocus,
        title: context.tr(LocaleKeys.label_register),
        keyboardDismissButtonColor: context.darkPrimaryContainer,
        keyboardDismissButtonHoverColor: context.darkSecondaryContainer,
        bottomSectionPadding: context.bottomPadding + 22.h,
        bottomSection: _buildBottomSection(),
        showBackButton: false,
        body: AutofillGroup(
          child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, signUpState) => EmailAndPasswordForm(
              emailController: emailController,
              emailFocusNode: emailFocusNode,
              onEmailChanged: context.read<RegisterCubit>().onEmailChanged,
              emailInError: !signUpState.email.isPure && signUpState.email.isNotValid,
              emailErrorMessage: signUpState.email.error?.errorName(context),
              passwordController: passwordController,
              passwordFocusNode: passwordFocusNode,
              onPasswordChanged: context.read<RegisterCubit>().onPasswordChanged,
              passwordInError: !signUpState.password.isPure && signUpState.password.isNotValid,
              passwordErrorMessage: signUpState.password.error?.errorName(context),
              // onPasswordEditingComplete: _registerWithEmailAndPassword,
              // onGoogleAuth: _loginWithGoogle,
              // isGoogleAuthInProgress: thirdPartyAuthState.googleAuthInProgress,
              showPasswordVisibilityButton: true,
              onGoogleAuth: () {},
              isGoogleAuthInProgress: false,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!widget.hideLoginButton) ...[
          AppTextButton(
            text: context.tr(LocaleKeys.label_have_an_account_question).toUpperCase(),
            textColor: context.lightTextColorSecondary,
            onTap: _onHaveAnAccount,
          ).autoFadeInRight(sequencePos: 5, slideFrom: 40),
          8.verticalSpace,
        ],
        Center(
          child: SizedBox(
            width: 0.6.sw,
            child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, signUpState) {
              return AppSolidButton(
                onTap: _registerWithEmailAndPassword,
                text: context.tr(LocaleKeys.button_register),
                isBusy: signUpState.authInProgress /*|| thirdPartyAuthState.authInProgress*/,
                backgroundColors: [
                  context.lightPrimaryContainer,
                  context.lightPrimaryContainer,
                ],
                shadowColor: Colors.black45,
                textColor: context.theme.colorScheme.primary,
                // textColor: context.darkPrimaryContainer,
                // useIconWhenBusy: thirdPartyAuthState.authInProgress,
              ).autoElasticIn(sequencePos: 6);
            }),
          ),
        ),
        24.verticalSpace,
        const AgreeToTermsHint().autoFadeIn(sequencePos: 7),
      ],
    );
  }

  void _registerWithEmailAndPassword() {
    final state = context.read<RegisterCubit>().state;
    if (!state.isValid) {
      HapticUtil.medium();
      context.read<RegisterCubit>().validate(
            email: state.email.value,
            password: state.password.value,
          );
    } else {
      _unfocus();
      _ensureConnected(context, context.read<RegisterCubit>().register);
    }
  }

  // void _loginWithGoogle() {
  //   _unfocus();
  //   _ensureConnected(context, context.read<ThirdPartyAuthCubit>().authorizeWithGoogle);
  // }

  void _onHaveAnAccount() {
    context
        .read<AuthenticationPageCubit>()
        .context
        .restorablePushReplacementNamedArgs(
          AuthenticationRoutes.login,
        );
  }

  void _ensureConnected(BuildContext context, Function function) {
    if (context.read<ConnectivityCubit>().state.isNetworkAccess) {
      function();
    } else {
      AppDialogs.showNoConnectionSnackbar();
    }
  }

  void _unfocus() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    primaryFocus?.unfocus();
  }
}
