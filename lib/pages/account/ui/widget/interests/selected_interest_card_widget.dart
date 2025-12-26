import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
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
  }) : this._(
          interest: interest,
          onLongTap: onLongTap,
          onTap: onTap,
        );

  const SelectedInterestCard.more({
    required VoidCallback onTap,
    required VoidCallback onLongTap,
  }) : this._(
          onLongTap: onLongTap,
          onTap: onTap,
        );

  final UserInterest? interest;
  final VoidCallback onTap;
  final VoidCallback onLongTap;

  static final width = 120.w;

  static const imageDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black38, Colors.transparent],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [0.2, 0.4],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isMoreCard = interest == null;

    return SizedBox.fromSize(
      size: Size.fromWidth(width),
      child: BackdropSurfaceContainer.ellipse(
        onTap: onTap,
        onLongTap: onLongTap,
        child: isMoreCard ? _buildMoreBody(context) : _buildInterestBody(context),
      ),
    );
  }

  Widget _buildInterestBody(BuildContext context) {
    return ClipRSuperellipse(
      borderRadius: BorderRadius.all(AppConstants.style.radius.cardSmall),
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: imageDecoration,
            child: Image.asset(
              AppConstants.assets.images.interest(interest!.id.value),
              fit: BoxFit.cover,
              cacheHeight: 500,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Center(
                child: Text(
                  interest!.tryTranslate(context) ?? '',
                  style: bodyS.copyWith(
                    color: context.lightTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreBody(BuildContext context) {
    return Center(
      child: CommonAppIcon(
        path: AppConstants.assets.icons.addLinear,
        color: context.iconColorSecondary,
        size: 28,
      ),
    );
  }
}
