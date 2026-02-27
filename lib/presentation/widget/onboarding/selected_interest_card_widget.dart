import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/constants/app/user_interests.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/animations/tap_animations/bounce_tap_animation.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedInterestCard extends StatelessWidget {
  const SelectedInterestCard._({
    this.interest,
    required this.onTap,
    required this.onLongTap,
  });

  const SelectedInterestCard.item({
    required UserInterest interest,
    required VoidCallback onTap,
    required VoidCallback onLongTap,
  }) : this._(interest: interest, onLongTap: onLongTap, onTap: onTap);

  const SelectedInterestCard.more({
    required VoidCallback onTap,
    required VoidCallback onLongTap,
  }) : this._(onLongTap: onLongTap, onTap: onTap);

  final UserInterest? interest;
  final VoidCallback onTap;
  final VoidCallback onLongTap;

  static final width = 122.w;

  static const imageDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black45, Colors.transparent],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [0.2, 0.4],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isMoreCard = interest == null;

    if (isMoreCard) {
      return SurfaceContainer.ellipse(
        onTap: onTap,
        onLongTap: onLongTap,
        borderColor: context.isLightTheme ? Colors.black12 : Colors.white10,
        size: Size.fromWidth(width),
        color: context.primaryContainer,
        child: _buildMoreBody(context),
      );
    }

    return BounceTapAnimation(
      onTap: onTap,
      onLongTap: onLongTap,
      child: SizedBox.fromSize(
        size: Size.fromWidth(width),
        child: _buildInterestBody(context),
      ),
    );
  }

  Widget _buildInterestBody(BuildContext context) {
    final shape = RoundedSuperellipseBorder(
      borderRadius: BorderRadius.all(AppConstants.style.radius.cardSmall),
      side: BorderSide(
        color: context.isLightTheme ? Colors.black12 : AppColors.white08,
      ),
    );

    return PhysicalShape(
      color: context.primaryContainer,
      clipper: ShapeBorderClipper(shape: shape),
      clipBehavior: Clip.hardEdge,
      child: DecoratedBox(
        decoration: ShapeDecoration(shape: shape),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: imageDecoration,
                child: Image.asset(
                  AppConstants.assets.images.interest(interest!.id.value),
                  fit: BoxFit.cover,
                  cacheWidth: (width * 2.0).toInt(),
                ),
              ),
            ),
            Positioned(
              left: 14.w,
              right: 14.w,
              bottom: 12.h,
              child: Center(
                child: Text(
                  interest!.tryTranslate(context) ?? '',
                  style: bodyM.copyWith(
                    color: context.lightTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreBody(BuildContext context) {
    return Center(
      child: CommonAppIcon(
        path: AppConstants.assets.icons.addLinear,
        color: context.iconColorSecondary,
        size: 38,
      ),
    );
  }
}
