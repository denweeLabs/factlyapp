import 'package:denwee/presentation/bloc/backgrounds/background_edit_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum BackgroundEditMode { text, background }

extension _BackgroundEditModeX on BackgroundEditMode {
  String get iconPath {
    switch (this) {
      case BackgroundEditMode.text:
        return AppConstants.assets.icons.textBlockLinear;
      case BackgroundEditMode.background:
        return AppConstants.assets.icons.galleryLinear;
    }
  }
}

class BackgroundEditModeSelector extends StatelessWidget {
  const BackgroundEditModeSelector({super.key});

  static final size = Size(100.w, 50.w);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: BlocBuilder<BackgroundEditCubit, BackgroundEditState>(
        builder: (context, state) {
          final pos = state.mode == BackgroundEditMode.text
              ? Alignment.centerLeft
              : Alignment.centerRight;

          final backgroundBrightness = state.backgroundStyle.brightness;
          final color = backgroundBrightness == Brightness.light
              ? context.darkIconColor
              : context.lightIconColor;

          return Container(
            decoration: ShapeDecoration(
              shape: RoundedSuperellipseBorder(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                side: BorderSide(color: color),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedAlign(
                  alignment: pos,
                  curve: Curves.ease,
                  duration: CustomAnimationDurations.ultraLow,
                  child: SizedBox.square(
                    dimension: size.height,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppConstants.style.colors
                            .commonColoredGradient(context),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _buildModeOption(
                      context: context,
                      selectedMode: state.mode,
                      mode: BackgroundEditMode.text,
                      onTap: context.read<BackgroundEditCubit>().changeMode,
                      color: color,
                    ),
                    _buildModeOption(
                      context: context,
                      selectedMode: state.mode,
                      mode: BackgroundEditMode.background,
                      onTap: context.read<BackgroundEditCubit>().changeMode,
                      color: color,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildModeOption({
    required BuildContext context,
    required BackgroundEditMode selectedMode,
    required BackgroundEditMode mode,
    required ValueChanged<BackgroundEditMode> onTap,
    required Color color,
  }) {
    final isSelected = selectedMode == mode;

    return Expanded(
      child: BounceTapAnimation(
        onTap: () => onTap(mode),
        child: Center(
          child: CommonAppIcon(
            path: mode.iconPath,
            color: isSelected
                ? context.lightIconColor
                : color.withValues(alpha: 0.6),
            size: 18,
          ),
        ),
      ),
    );
  }
}
