import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_colors.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animated_icons/smiling_star_animated_icon_widget.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class StarsChangeOverlayAnimation extends StatefulWidget {
  const StarsChangeOverlayAnimation({super.key});

  @override
  State<StarsChangeOverlayAnimation> createState() => _StarsChangeOverlayAnimationState();
}

class _StarsChangeOverlayAnimationState extends State<StarsChangeOverlayAnimation> {
  late int _lastStarsCount;
  late int _changedStarsCount;
  late bool _isAnimate;
  late bool _isEarned;

  @override
  void initState() {
    super.initState();

    final statsCubit = context.read<UserStatisticsCubit>();

    _isEarned = true;
    _isAnimate = false;
    _changedStarsCount = 0;
    _lastStarsCount = statsCubit.state.statistics.stars;

    statsCubit.stream.listen((state) {
      final isInitiallyLoaded = state.isInitiallyLoaded;
      final isChanged = state.statistics.stars != _lastStarsCount;

      _isEarned = state.statistics.stars > _lastStarsCount;
      _changedStarsCount = state.statistics.stars - _lastStarsCount;

      if (isInitiallyLoaded && isChanged && !_isAnimate) {
        toggleAnimation(true);
      }

      _lastStarsCount = state.statistics.stars;
    });
  }

  void toggleAnimation(bool flag) {
    if (!mounted) return;
    setState(() => _isAnimate = flag);
  }

  @override
  Widget build(BuildContext context) {
    final overlayTranslate = MovieTweenProperty<double>();
    final overlayFade = MovieTweenProperty<double>();
    final overlayMovieTween = MovieTween()
      ..scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 1000),
          )
          .tween<double>(
            overlayTranslate,
            Tween(begin: -100.w, end: -1.0),
            curve: Curves.linearToEaseOut,
          )
          .tween<double>(overlayFade, Tween(begin: 0.0, end: 1.0))
      ..scene(
            begin: const Duration(milliseconds: 3000),
            end: const Duration(milliseconds: 3500),
          )
          .tween<double>(
            overlayTranslate,
            Tween(begin: -1.0, end: -100.w),
            curve: Curves.easeInToLinear,
          )
          .tween<double>(
            overlayFade,
            Tween(begin: 1.0, end: 0.0),
            curve: Curves.easeIn,
          );

    final starRotation = MovieTweenProperty<double>();
    final starMovieTween = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 400),
        end: const Duration(milliseconds: 1700),
      ).tween<double>(
        starRotation,
        Tween(begin: -1.0, end: 0.0),
        curve: CustomAnimationCurves.mediumElasticOut,
      )
      ..scene(
        begin: const Duration(milliseconds: 2800),
        end: const Duration(milliseconds: 3400),
      ).tween<double>(
        starRotation,
        Tween(begin: 0.0, end: -2.0),
        curve: Curves.easeInToLinear,
      );

    return CustomAnimationBuilder<Movie>(
      tween: overlayMovieTween,
      duration: overlayMovieTween.duration,
      control: _isAnimate ? Control.playFromStart : Control.stop,
      onCompleted: () => toggleAnimation(false),
      builder: (context, value, child) => Transform.translate(
        offset: Offset(overlayTranslate.from(value), 0.0),
        child: Opacity(opacity: overlayFade.from(value), child: child!),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.darkPrimaryContainer,
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(16),
          ),
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)],
          border: Border.all(color: Colors.white24),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ).copyWith(right: 14.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAnimationBuilder<Movie>(
              tween: starMovieTween,
              duration: starMovieTween.duration,
              control: _isAnimate ? Control.playFromStart : Control.stop,
              builder: (context, value, child) => Transform.rotate(
                angle: starRotation.from(value),
                child: child!,
              ),
              child: const SmilingStarAnimatedIcon(animate: true, size: 16),
            ),
            4.horizontalSpace,
            Text(
              _isEarned ? '+$_changedStarsCount' : '-$_changedStarsCount',
              style: bodyS.copyWith(
                color: _isEarned ? AppColors.lightGreen : AppColors.lightRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
