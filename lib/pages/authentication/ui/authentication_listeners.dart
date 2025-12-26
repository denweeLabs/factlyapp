import 'package:denwee/core/auth/domain/failure/change_password_failure.dart';
import 'package:denwee/core/auth/domain/failure/login_failure.dart';
import 'package:denwee/core/auth/domain/failure/register_failure.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/pages/authentication/args/authentication_action_result.dart';
import 'package:denwee/pages/authentication/ui/login/cubit/login_cubit.dart';
import 'package:denwee/pages/authentication/ui/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationListeners extends StatelessWidget {
  const AuthenticationListeners({
    super.key,
    required this.onSuccessResult,
    required this.child,
  });

  final void Function(AuthorizationActionResult) onSuccessResult;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [_loginListener, _registerListener, _resetPassListener],
      child: child,
    );
  }

  BlocListener get _loginListener => BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.failureOrSuccess.toNullable()!.fold(
            (failure) {
              HapticUtil.medium();
              AppDialogs.showErrorSnackbar(
                description: failure.errorMessage(context),
              );
            },
            (_) {
              HapticUtil.light();
              _onAuthorizationSuccess(
                context,
                AuthorizationActionResult.loggedIn,
              );
            },
          );
        },
        listenWhen: (p, c) =>
            p.authInProgress &&
            !c.authInProgress &&
            c.failureOrSuccess.isSome(),
      );

  BlocListener get _registerListener =>
      BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.failureOrSuccess.toNullable()!.fold(
            (failure) {
              HapticUtil.medium();
              AppDialogs.showErrorSnackbar(
                description: failure.errorMessage(context),
              );
            },
            (_) {
              HapticUtil.light();
              _onAuthorizationSuccess(
                context,
                AuthorizationActionResult.signedUp,
              );
            },
          );
        },
        listenWhen: (p, c) =>
            p.authInProgress &&
            !c.authInProgress &&
            c.failureOrSuccess.isSome(),
      );

  BlocListener get _resetPassListener => BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.resetPassFailureOrSuccess.toNullable()!.fold(
            (failure) {
              HapticUtil.medium();
              AppDialogs.showErrorSnackbar(
                description: failure.errorMessage(context),
              );
            },
            (_) {
              HapticUtil.light();
              AppDialogs.showResetPasswordLinkSentDialog(context);
            },
          );
        },
        listenWhen: (p, c) =>
            p.resetPassInProgress &&
            !c.resetPassInProgress &&
            c.resetPassFailureOrSuccess.isSome(),
      );


  void _onAuthorizationSuccess(
      BuildContext context, AuthorizationActionResult result) {
    // if (result == AuthorizationActionResult.signedUp) {
    //   TextInput.finishAutofillContext(); // call autofill update
    // }
    onSuccessResult(result);
  }
}
