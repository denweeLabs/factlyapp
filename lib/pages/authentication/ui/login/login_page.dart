// ignore_for_file: use_build_context_synchronously

import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:denwee/core/ui/bloc/connectivity_cubit/connectivity_cubit.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_left.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_text_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_keyboard_padded_body_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:denwee/pages/authentication/ui/cubit/authentication_page_cubit.dart';
import 'package:denwee/pages/authentication/ui/login/cubit/login_cubit.dart';
import 'package:denwee/pages/authentication/ui/widget/agree_to_terms_hint_widget.dart';
import 'package:denwee/pages/authentication/ui/widget/email_and_password_form_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.hideRegisterButton});

  final bool hideRegisterButton;

  static const routeName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LoginCubit>().state;
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
      style: CommonBackgroundStyle.colored,
      systemNavigationBarContrastEnforced: false,
      body: CommonKeyboardPaddedBody(
        keyboardDismissAction: _unfocus,
        title: context.tr(LocaleKeys.label_login),
        bottomSectionPadding: context.bottomPadding + 22.h,
        bottomSection: _buildBottomSection(),
        keyboardDismissButtonColor: context.darkPrimaryContainer,
        keyboardDismissButtonHoverColor: context.darkSecondaryContainer,
        showBackButton: false,
        body: AutofillGroup(
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, signInState) => Column(
              children: [
                EmailAndPasswordForm(
                  emailController: emailController,
                  emailFocusNode: emailFocusNode,
                  onEmailChanged: context.read<LoginCubit>().onEmailChanged,
                  emailInError: !signInState.email.isPure && signInState.email.isNotValid,
                  emailErrorMessage: signInState.email.error?.errorName(context),
                  passwordController: passwordController,
                  passwordFocusNode: passwordFocusNode,
                  onPasswordChanged: context.read<LoginCubit>().onPasswordChanged,
                  passwordInError: !signInState.password.isPure && signInState.password.isNotValid,
                  passwordErrorMessage: signInState.password.error?.errorName(context),
                  onPasswordEditingComplete: _loginWithEmailAndPassword,
                  onGoogleAuth: () {},
                  isGoogleAuthInProgress: false,
                  onForgotPass: _onForgotPass,
                  isForgotPassInProgress: signInState.resetPassInProgress,
                  // onGoogleAuth: _loginWithGoogle,
                  // isGoogleAuthInProgress:
                  //     thirdPartyAuthState.googleAuthInProgress,
                ),
              ],
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
        if (!widget.hideRegisterButton) ...[
          AppTextButton(
            text: context.tr(LocaleKeys.label_dont_have_an_account_question).toUpperCase(),
            textColor: context.lightTextColorSecondary,
            onTap: _onDontHaveAccount,
          ).autoFadeInLeft(sequencePos: 5, slideFrom: 40),
          8.verticalSpace,
        ],
        Center(
          child: SizedBox(
            width: 0.6.sw,
            child: BlocBuilder<LoginCubit, LoginState>(builder: (context, loginState) {
              return AppSolidButton(
                onTap: _loginWithEmailAndPassword,
                text: context.tr(LocaleKeys.button_login),
                isBusy: loginState.authInProgress /*|| thirdPartyAuthState.authInProgress*/,
                backgroundColors: [
                  context.lightPrimaryContainer,
                  context.lightPrimaryContainer,
                ],
                shadowColor: Colors.black45,
                textColor: context.theme.colorScheme.primary,
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

  void _loginWithEmailAndPassword() {
    final state = context.read<LoginCubit>().state;
    if (!state.isValid) {
      HapticUtil.medium();
      context.read<LoginCubit>().validate(
            email: state.email.value,
            password: state.password.value,
          );
    } else {
      _unfocus();
      _ensureConnected(context, context.read<LoginCubit>().login);
    }
  }

  // void _loginWithGoogle() {
  // _unfocus();
  // _ensureConnected(
  // context, context.read<ThirdPartyAuthCubit>().authorizeWithGoogle);
  // }

  void _onForgotPass() async {
    _unfocus();
    final state = context.read<LoginCubit>().state;
    final initialEmail = state.email.isValid ? state.email : null;
    final resetPassEmail = await AppDialogs.showEnterEmailPromptDialog(
      context,
      initialEmail: initialEmail,
    );
    if (resetPassEmail != null) {
      emailController.text = resetPassEmail.value;
      context.read<LoginCubit>().onEmailChanged(resetPassEmail.value);
      context.read<LoginCubit>().sendResetPassEmail(resetPassEmail);
    }
  }

  void _onDontHaveAccount() {
    context
        .read<AuthenticationPageCubit>()
        .context
        .restorablePushReplacementNamedArgs(
          AuthenticationRoutes.register,
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
