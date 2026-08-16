// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/widget/backgrounds/background_edit_action_slider_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/background_edit_color_bubbles_list_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/background_edit_mode_selector_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/background_edit_fact_preview_pages_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/background_edit_unlock_button_widget.dart';
import 'package:denwee/presentation/widget/facts/stories_components/src/widgets/stories_view_gestures_area_widget.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/bloc/backgrounds/background_edit_cubit.dart';
import 'package:denwee/presentation/widget/backgrounds/background_preview_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:utils/utils.dart';
import 'package:denwee/core/analytics/domain/entity/paywall_source.dart';
import 'package:denwee/presentation/page/premium_paywall/premium_paywall_page.dart';

class BackgroundEditPage extends StatefulWidget {
  const BackgroundEditPage({super.key, required this.background});

  final AvailableBackground background;

  static const routeName = 'BackgroundEditPage';

  @override
  State<BackgroundEditPage> createState() => _BackgroundEditPageState();
}

class _BackgroundEditPageState extends State<BackgroundEditPage> {
  static const pageSwitchDuration = Duration(milliseconds: 500);
  static const pageSwitchCurve = Curves.ease;

  late final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _applyBackgroundListener(
    BuildContext context,
    ActiveBackgroundState state,
  ) async {
    state.mapOrNull(
      applied: (data) async {
        HapticUtil.medium();

        context.read<BackgroundEditCubit>().onSuccessBackgroundApply(
          data.isPurchasedViaStars,
        );

        if (data.isPurchasedViaStars) {
          await Future.delayed(CustomAnimationDurations.mediumHigh);
        }

        if (!context.mounted) return;

        context.restorablePushReplacementNamedArgs(
          Routes.homeCrossFade,
          rootNavigator: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActiveBackgroundCubit, ActiveBackgroundState>(
      listener: _applyBackgroundListener,
      listenWhen: (p, c) => p.isApplying && !c.isApplying && c.isApplied,
      child: CommonPopScope(
        onWillPop: _goBack,
        child: CommonScaffold(
          systemNavigationBarContrastEnforced: false,
          backgroundColor: AppColors.primaryBackground[ThemeType.dark],
          systemOverlayType: ThemeType.dark,
          body: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackground(),
              _buildFactPages(),
              _buildGestures(),
              _buildBottomActions(),
              _buildTopHeader(),
              _buildSideSlider(),
              _buildBackgroundPurchaseAnimation(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
      builder: (context, state) => BackgroundPreviewContent(
        volume: 1.0,
        asset: widget.background.asset,
        foregroundColor: state.backgroundFadeColor.withValues(
          alpha: state.backgroundFade,
        ),
      ),
    );
  }

  Widget _buildBackgroundPurchaseAnimation() {
    return IgnorePointer(
      child: BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
        builder: (context, state) => Stack(
          fit: StackFit.expand,
          children: [
            AnimatedOpacity(
              duration: CustomAnimationDurations.ultraLow,
              opacity: state.showPurchaseAnimation ? 0.6 : 0.0,
              child: const ColoredBox(color: Colors.black),
            ),
            if (state.showPurchaseAnimation)
              Lottie.asset(
                AppConstants.assets.animations.confetti,
                fit: BoxFit.cover,
                repeat: false,
                animate: true,
              ),
          ],
        ),
      ),
    );
  } 

  Widget _buildFactPages() {
    return BackgroundEditFactPreviewPages(
      pageController: pageController,
      pageSwitchDuration: pageSwitchDuration,
      pageSwitchCurve: pageSwitchCurve,
    );
  }

  Widget _buildTopHeader() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: context.topPadding + 14.h,
      child: Row(
        children: [
          BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
            builder: (context, state) {
              final backgroundBrightness = state.backgroundStyle.brightness;
              final color = backgroundBrightness == Brightness.light
                  ? context.darkIconColor
                  : context.lightIconColor;
              
              return AppBackButton(
                onTap: _goBack,
                color: color,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
              );
            },
          ),
          const Spacer(),
          const BackgroundEditModeSelector(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(width: 30.w),
          ),
        ],
      ),
    );
  }

  Widget _buildSideSlider() {
    return Positioned(
      right: 0.0,
      top: context.topPadding + 20.h,
      height: 200.h,
      child: BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
        builder: (context, state) {
          final cubit = context.read<BackgroundEditCubit>();
          final backgroundBrightness = state.backgroundStyle.brightness;
          final color = backgroundBrightness == Brightness.light
              ? context.darkIconColor.withValues(alpha: 0.3)
              : const Color(0xC8D7D7D7);

          return BackgroundEditActionSlider(
            width: 18,
            value: cubit.sliderValue,
            onChanged: cubit.changeSliderValue,
            isSnapping: state.mode == BackgroundEditMode.text,
            triangleColor: color,
          );
        },
      ),
    );
  }

  Widget _buildGestures() {
    return StoriesViewGesturesArea(
      ignorePointer: false,
      onHold: () {},
      onRelease: () {},
      onLeft: () => pageController.previousPage(
        duration: pageSwitchDuration,
        curve: pageSwitchCurve,
      ),
      onRight: () => pageController.nextPage(
        duration: pageSwitchDuration,
        curve: pageSwitchCurve,
      ),
    );
  }

  Widget _buildBottomActions() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: _getBottomSectionInset(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.fromSize(
            size: Size.fromHeight(BackgroundEditColorBubblesList.height),
            child: BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
              builder: (context, state) {
                final cubit = context.read<BackgroundEditCubit>();

                return BackgroundEditColorBubblesList(
                  onColorSelected: context.read<BackgroundEditCubit>().changeColorPickerValue,
                  selectedColor: cubit.colorPickerValue,
                  defaultColor: state.mode == BackgroundEditMode.text
                      ? widget.background.style.textColor
                      : widget.background.style.backgroundFadeColor,
                );
              },
            ),
          ),
          12.verticalSpace,
          Center(
            child: BlocSelector<BackgroundEditCubit, BackgroundEditState, bool>(
              selector: (state) => state.hasChanges,
              builder: (context, hasChanges) => SizedBox(
                width: 0.55.sw,
                child: BackgroundEditUnlockButton(
                  hasChanges: hasChanges,
                  background: widget.background,
                  onTap: _onUnlockTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goBack() {
    if (context.read<ActiveBackgroundCubit>().state.isApplying) return;
    Navigator.of(context).pop();
  }

  void _onUnlockTap(BackgroundUnlockButtonState state) async {
    switch (state) {
      case BackgroundUnlockButtonState.canApply:
        _applyBackground();
        break;

      case BackgroundUnlockButtonState.premiumRequired:
        context.restorablePushNamedArgs(
          Routes.premiumPaywall,
          rootNavigator: true,
          argsToJson: () => PremiumPaywallPage.args(PaywallSource.backgroundEdit),
        );
        break;

      case BackgroundUnlockButtonState.canUnlockWithStars:
        final isOk = await AppDialogs.showBackgroundUnlockConfirmationDialog(context, widget.background.price);
        if (isOk == true) _applyBackground();
        break;

      case BackgroundUnlockButtonState.insufficientStars:
        final currentBalance = getIt<UserStatisticsCubit>().state.statistics.stars;
        final starsLeftToUnlock = widget.background.price - currentBalance;
        AppDialogs.showBackgroundInsufficientBalanceDialog(context, starsLeftToUnlock);
        break;
    }
  }

  void _applyBackground() {
    final body = ApplyBackgroundBody(
      backgroundId: widget.background.id,
      style: context.read<BackgroundEditCubit>().state.backgroundStyle,
    );
    getIt<ActiveBackgroundCubit>().applyCustomBackground(body);
  }

  double _getBottomSectionInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    if (Platform.isIOS) return hasBottomPadding ? bottomPadding + 8.h : 24.h;
    return hasBottomPadding ? bottomPadding + 18.h : 24.h;
  }
}
