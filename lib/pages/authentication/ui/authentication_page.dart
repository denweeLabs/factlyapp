import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_out_left.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/pages/authentication/args/authentication_page_args.dart';
import 'package:denwee/pages/authentication/ui/authentication_listeners.dart';
import 'package:denwee/pages/authentication/ui/authentication_routes.dart';
import 'package:denwee/pages/authentication/ui/cubit/authentication_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key, required this.args});

  static const routeName = 'AuthenticationPage';

  final AuthenticationPageArgs args;

  bool _pageListener(BuildContext context, AuthenticationPageState p,
      AuthenticationPageState c) {
    if (p.successResult.isNone() && c.successResult.isSome()) {
      Navigator.pop(context, c.successResult.toNullable()!);
      return false;
    }

    if (!p.isPopped && c.isPopped) {
      Navigator.of(context).pop();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationPageCubit, AuthenticationPageState>(
      listener: (_, _) {},
      listenWhen: (p, c) => _pageListener(context, p, c),
      child: AuthenticationListeners(
        onSuccessResult:
            context.read<AuthenticationPageCubit>().setSuccessResult,
        child: CommonPopScope(
          onWillPop: () => _popBack(context),
          child: Stack(
            children: [
              Navigator(
                key: context.read<AuthenticationPageCubit>().navigatorKey,
                onGenerateRoute: (settings) => authRouteFactory(settings, args),
                initialRoute: args.initialRoute,
                restorationScopeId: 'authentication_page_navigator',
              ),
              _buildBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      left: 0.0,
      top: 0.0,
      child: SafeArea(
        child: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) => AppBackButton(
            color: context.lightIconColor,
            onTap: () => _popBack(context),
          ).autoFadeOutLeft(
            slideTo: 100,
            animate: isKeyboardVisible,
            reverseDuration: CustomAnimationDurations.low,
          ),
        ),
      ),
    );
  }

  Future<void> _popBack(BuildContext context) async {
    final isWillPop = await _onWillPop(context);
    if (isWillPop) context.read<AuthenticationPageCubit>().pop();
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final isFirstRouteInCurrentTab = !(await context
        .read<AuthenticationPageCubit>()
        .navigatorKey
        .currentState!
        .maybePop());
    return isFirstRouteInCurrentTab;
  }
}
