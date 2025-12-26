import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_in.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/elastic_out.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/buttons/action_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/pages/account/change_language/change_language_page.dart';
import 'package:denwee/pages/account/ui/account_page.dart';
import 'package:denwee/pages/account/ui/account_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class AccountBasePage extends StatefulWidget {
  const AccountBasePage({super.key});

  static const routeName = 'AccountBasePage';

  static const fabSize = 66;
  static double fabBottomPadding(BuildContext context) {
    return context.bottomPadding / 1.2 + 24.w;
  }
  static double safeAreaBottomPadding(BuildContext context) {
    return fabBottomPadding(context) + fabSize.w;
  }

  static const fabVisiblePages = <String>[
    AccountPage.routeName,
    ChangeLanguagePage.routeName,
  ];

  @override
  State<AccountBasePage> createState() => _AccountBasePageState();
}

class _AccountBasePageState extends State<AccountBasePage> {
  late final navigatorKey = GlobalKey<NavigatorState>();
  late final currentRoute = ValueNotifier(AccountPage.routeName);

  @override
  void dispose() {
    currentRoute.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonPopScope(
      onWillPop: () => _onWillPop(context),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Navigator(
            key: navigatorKey,
            initialRoute: AccountPage.routeName,
            onGenerateRoute: accountRouteFactory,
            observers: [_RouteObserver((route) => currentRoute.value = route)],
          ),
          Positioned(
            right: 28.w,
            bottom: AccountBasePage.fabBottomPadding(context),
            child: ValueListenableBuilder(
              valueListenable: currentRoute,
              builder: (context, currentRoute, child) {
                final isVisibleByRoute = AccountBasePage.fabVisiblePages
                    .contains(currentRoute);

                return IgnorePointer(
                  ignoring: !isVisibleByRoute,
                  child:
                      AppActionButton(
                        iconSize: 23,
                        size: AccountBasePage.fabSize,
                        onTap: () => context.restorablePushReplacementNamedArgs(
                          Routes.home,
                        ),
                        iconPath: AppConstants.assets.icons.homeLinear,
                      ).autoElasticIn(
                        sequencePos: 2,
                        fadeCurve: CustomAnimationCurves.instant,
                      ),
                ).autoElasticOut(
                  animate: !isVisibleByRoute,
                  duration: CustomAnimationDurations.ultraLow,
                  reverseDuration: CustomAnimationDurations.low,
                  scaleCurve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
                  scaleReverseCurve: Curves.easeInOutBack,
                  fadeReverseCurve: Curves.ease,
                  forceComplete: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onWillPop(BuildContext context) async {
    final canPop = await navigatorKey.currentState!.maybePop();
    if (!canPop) {
      context.restorablePushReplacementNamedArgs(Routes.home);
    }
  }
}

class _RouteObserver extends NavigatorObserver {
  _RouteObserver(this.onRoute);

  final ValueChanged<String> onRoute;

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    setRoute(previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    setRoute(route);
  }

  void setRoute(Route? route) {
    final routeName = route?.settings.name;
    if (routeName != null) {
      onRoute(routeName);
    }
  }
}
