import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/animations/scroll_physics/less_responsive_scroll_physics.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/coloration_item_bubble_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorationOverviewSelector extends StatefulWidget {
  const ColorationOverviewSelector({super.key});

  static final height = 140.h;

  @override
  State<ColorationOverviewSelector> createState() =>
      _ColorationOverviewSelectorState();
}

class _ColorationOverviewSelectorState extends State<ColorationOverviewSelector> {
  static final bubbleSize = (ColorationOverviewSelector.height / 2.0);
  static const viewportFraction = 0.33;
      
  late final PageController pageController;

  @override
  void initState() {
    final currentColorationId =
        context.read<UserPreferencesCubit>().state.preferences.theme.colorationId;
    final pageIndex = AppConstants.config.themeColorations.indexWhere(
      (e) => e.id == currentColorationId,
    );
    pageController = PageController(
      viewportFraction: viewportFraction,
      initialPage: pageIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, UserPreferencesState state) {
    final newId = state.preferences.theme.colorationId;
    final pageIndex = AppConstants.config.themeColorations.indexWhere(
      (e) => e.id == newId,
    );
    if (pageIndex != pageController.page?.round()) {
      _animateTo(pageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPreferencesCubit, UserPreferencesState>(
      listener: _listener,
      listenWhen: (p, c) => p.preferences.theme.colorationId != c.preferences.theme.colorationId,
      child: SizedBox.fromSize(
        size: Size.fromHeight(ColorationOverviewSelector.height),
        child: DecoratedBox(
          decoration: ShapeDecoration(
            gradient: AppConstants.style.colors.commonColoredGradient(context),
            shape: const RoundedSuperellipseBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              side: BorderSide(color: Colors.black12),
            ),
            shadows: [
              BoxShadow(
                color: context.theme.colorScheme.primary,
                offset: const Offset(0.0, 10.0),
                spreadRadius: -12.0,
                blurRadius: 18.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -18.w,
                bottom: -14.w,
                child: CommonAppIcon(
                  path: AppConstants.assets.icons.brushLinear,
                  color: context.darkPrimaryContainer.withValues(alpha: 0.08),
                  size: 128,
                ),
              ),
              PageView.builder(
                controller: pageController,
                onPageChanged: _onPageChanged,
                physics: const LessResponsiveScrollPhysics(),
                itemCount: AppConstants.config.themeColorations.length,
                itemBuilder: (context, index) {
                  final coloration = AppConstants.config.themeColorations[index];
                  final isSelected = context
                          .read<UserPreferencesCubit>()
                          .state
                          .preferences
                          .theme
                          .colorationId ==
                      coloration.id;
                  return ColorationItemBubble(
                    size: bubbleSize,
                    index: index,
                    offset: Offset.zero,
                    coloration: coloration,
                    isSelected: isSelected,
                    onTap: (_) => _animateTo(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animateTo(int index) {
    pageController.animateToPage(
      index,
      duration: CustomAnimationDurations.low,
      curve: CustomAnimationCurves.fasterEaseInToSlowEaseOut,
    );
  }

  void _onPageChanged(int index) {
    HapticUtil.light();
    getIt<UserPreferencesCubit>().changeThemeColoration(
      AppConstants.config.themeColorations[index].id,
    );
  }
}