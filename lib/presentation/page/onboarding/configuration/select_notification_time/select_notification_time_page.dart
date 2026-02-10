import 'package:animate_do/animate_do.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_out_up.dart';
import 'package:denwee/presentation/widget/shared/animations/misc/route_aware_animated.dart';
import 'package:denwee/presentation/widget/shared/animations/misc/route_observer_scope.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/page/onboarding/configuration/onboarding_configuration_page.dart';
import 'package:denwee/presentation/bloc/onboarding/select_notification_time_cubit.dart';
import 'package:denwee/presentation/widget/onboarding/dummy_notification_tile_widget.dart';
import 'package:denwee/presentation/widget/onboarding/notification_time_selector_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectNotificationTimePage extends StatelessWidget {
  const SelectNotificationTimePage({super.key});

  static const routeName = 'SelectNotificationTimePage';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      iconPath: AppConstants.assets.icons.clockLinear,
      systemNavigationBarContrastEnforced: false,
      body: RouteAwareAnimated(
        observer: RouteObserverScope.of(context),
        builder: (context, controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: OnboardingConfigurationPage.contentTopPadding(context),
            ),
            32.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child:
                  Text(
                        context.tr(LocaleKeys.onboarding_select_notification_time_title),
                        style: h0.copyWith(
                          height: 1.4,
                          letterSpacing: -0.6,
                          color: context.textColor,
                        ),
                        textAlign: TextAlign.center,
                      )
                      .autoFadeInUp(sequencePos: 1)
                      .routeAwareFadeOutUp(
                        controller: controller,
                        sequencePos: 0,
                        sequenceTotal: 3,
                      ),
            ),
            20.verticalSpace,
            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    context.tr(LocaleKeys.onboarding_select_notification_time_subtitle),
                    style: bodyL.copyWith(
                      color: context.textColorTernary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                .autoFadeInUp(sequencePos: 2)
                .routeAwareFadeOutUp(
                  controller: controller,
                  sequencePos: 1,
                  sequenceTotal: 3,
                ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.2),
                    RepaintBoundary(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: _buildNotificationTiles(context).routeAwareFadeOutUp(
                          controller: controller,
                          sequencePos: 2,
                          sequenceTotal: 3,
                        ),
                      ),
                    ),
                    32.verticalSpace,
                    Expanded(
                      child: SizedBox(
                        width: constraints.maxWidth * 0.75,
                        child:
                            NotificationTimeSelector(
                                  initialTime: context
                                      .read<SelectNotificationTimeCubit>()
                                      .state
                                      .time,
                                  onChanged: context
                                      .read<SelectNotificationTimeCubit>()
                                      .changeTime,
                                )
                                .autoFadeIn(sequencePos: 7)
                                .routeAwareFadeOutUp(
                                  controller: controller,
                                  sequencePos: 2,
                                  sequenceTotal: 3,
                                ),
                      ),
                    ),
                    32.verticalSpace,
                  ],
                ),
              ),
            ),
            SizedBox(
              height: OnboardingConfigurationPage.contentBottomPadding(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTiles(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -12.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: SizedBox(
                width: constraints.maxWidth * 0.88,
                child: const DummyNotificationTile().autoFadeIn(sequencePos: 7),
              ),
            ),
          ),
          const DummyNotificationTile()
              .autoFadeInUp(sequencePos: 4)
              .tada(
                delay: const Duration(milliseconds: 1500),
                duration: const Duration(milliseconds: 3000),
                curve: const Interval(0.5, 1.0, curve: Curves.ease),
              ),
        ],
      ),
    );
  }
}
