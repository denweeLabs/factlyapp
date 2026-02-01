// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:denwee/core/backgrounds/domain/entity/apply_background_body.dart';
import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_selection_item.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_fact_page_widget.dart';
import 'package:denwee/core/facts/ui/stories_components/src/widgets/stories_view_gestures_area_widget.dart';
import 'package:denwee/core/ui/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/sparkles_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/back_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/available_backgrounds/util/background_selection_util.dart';
import 'package:denwee/pages/background_edit/cubit/background_edit_cubit.dart';
import 'package:denwee/pages/background_edit/widget/background_preview_content_widget.dart';
import 'package:denwee/pages/fact_details/ui/cubit/fact_explanation_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:utils/utils.dart';

part 'widget/action_slider_widget.dart';
part 'widget/color_bubbles_list_widget.dart';
part 'widget/mode_selector_widget.dart';
part 'widget/preview_fact_pages_widget.dart';
part 'widget/unlock_button_widget.dart';

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

  bool _backgroundApplyListener(
    ActiveBackgroundState p,
    ActiveBackgroundState c,
  ) {
    final isApplied = p.isApplying && !c.isApplying && c.isApplied;

    if (isApplied) {
      c.mapOrNull(
        applied: (data) {
          HapticUtil.medium();
          context.read<BackgroundEditCubit>().onSuccessBackgroundApply(
            data.isPurchasedViaStars,
          );
          _openHome(
            data.isPurchasedViaStars
                ? CustomAnimationDurations.mediumHigh
                : null,
          );
        },
      );
    }

    return false;
  }

  void _openHome([Duration? delay]) {
    if (delay != null) {
      Future.delayed(delay, () {
        if (!mounted) return;
        context.restorablePushReplacementNamedArgs(
          Routes.homeCrossFade,
          rootNavigator: true,
        );
      });
    } else {
      context.restorablePushReplacementNamedArgs(
        Routes.homeCrossFade,
        rootNavigator: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActiveBackgroundCubit, ActiveBackgroundState>(
      listener: (_, __) {},
      listenWhen: _backgroundApplyListener,
      child: CommonPopScope(
        onWillPop: _goBack,
        child: CommonScaffold(
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
    return _PreviewFactPages(
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
          const _EditModeSelector(),
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

          return _BackgroundEditActionSlider(
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
            size: Size.fromHeight(_ColorBubblesList.height),
            child: BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
              builder: (context, state) {
                final cubit = context.read<BackgroundEditCubit>();

                return _ColorBubblesList(
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
                width: 0.6.sw,
                child: _UnlockButton(
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
