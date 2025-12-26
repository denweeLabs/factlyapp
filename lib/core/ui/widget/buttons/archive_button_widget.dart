import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/core_tap_bounce_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppArchiveButtonType {
  iconOnly,
  surfaceSmall,
  outlineBig,
}

class AppArchiveButton extends StatelessWidget {
  const AppArchiveButton({
    super.key,
    required this.factId,
    required this.type,
    this.iconPadding,
    this.iconColor,
  });

  final UniqueId factId;
  final AppArchiveButtonType type;
  final EdgeInsets? iconPadding;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BlocBuilder<FactsArchiveCubit, FactsArchiveState>(
        builder: (context, state) {
          final isArchived = state.isArchived(factId);
      
          switch (type) {
            case AppArchiveButtonType.iconOnly: return _buildIconOnly(context, isArchived);
            case AppArchiveButtonType.surfaceSmall: return _buildSurfaceSmall(context, isArchived);
            case AppArchiveButtonType.outlineBig: return _buildOutlineBig(isArchived);
          }
        },
      ),
    );
  }

  Widget _buildIconOnly(BuildContext context, bool isArchived) {
    return AppIconButton(
      onTap: () => _onTap(isArchived),
      color: iconColor ?? context.lightIconColor,
      padding: iconPadding ?? EdgeInsets.symmetric(horizontal: 26.w),
      iconPath: isArchived
          ? AppConstants.assets.icons.archiveTickBold
          : AppConstants.assets.icons.archiveTickLinear,
      size: 24,
    );
  }

  Widget _buildSurfaceSmall(BuildContext context, bool isArchived) {
    return BackdropSurfaceContainer.circle(
      onTap: () => _onTap(isArchived),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: CommonAppIcon(
          path: isArchived
              ? AppConstants.assets.icons.archiveTickBold
              : AppConstants.assets.icons.archiveTickLinear,
          color: context.lightIconColor,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildOutlineBig(bool isArchived) {
    return CoreTapBounceAnimation(
      onTap: () => _onTap(isArchived),
      builder: (context, isHovered) => AnimatedContainer(
        curve: CoreTapBounceAnimation.curve,
        duration: CoreTapBounceAnimation.duration,
        width: 60.h,
        height: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isHovered ? Colors.white12 : Colors.transparent,
          border: Border.all(color: Colors.white70),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CommonAppIcon(
              path: isArchived
                  ? AppConstants.assets.icons.archiveTickBold
                  : AppConstants.assets.icons.archiveTickLinear,
              color: context.lightIconColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(bool isArchived) async {
    isArchived
        ? await getIt<FactsArchiveCubit>().remove(factId)
        : await getIt<FactsArchiveCubit>().add(factId);
  }
}
