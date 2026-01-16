import 'dart:ui';

import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DummyNotificationTile extends StatelessWidget {
  const DummyNotificationTile({super.key, this.isFront = true});

  final bool isFront;

  static const borderRadius = BorderRadius.all(Radius.circular(28));

  @override
  Widget build(BuildContext context) {
    if (!isFront || context.isLightTheme) {
      return _buildTileBody(context);
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: _buildTileBody(context),
      ),
    );
  }

  Widget _buildTileBody(BuildContext context) {
    final borderColor = context.isLightTheme ? Colors.black12 : Colors.white10;
    final backgroundColorOpacity = !isFront || context.isLightTheme
        ? 1.0
        : 0.75;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: borderRadius,
        color: context.primaryContainer.withValues(
          alpha: backgroundColorOpacity,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 10.0),
            spreadRadius: -10.0,
            blurRadius: 10.0,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(14.w, 10.h, 18.w, 10.h),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(AppConstants.assets.images.appBackgroundIcon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.tr(
                        LocaleKeys
                            .onboarding_select_notification_time_dummy_notification_title,
                      ),
                      style: h5.copyWith(
                        color: context.textColor,
                        fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      context.tr(
                        LocaleKeys
                            .onboarding_select_notification_time_dummy_notification_time_ago,
                      ),
                      style: bodyM.copyWith(
                        color: context.textColorTernary,
                        fontFamily:
                            AppConstants.style.textStyle.secondaryFontFamiliy,
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    context.tr(
                      LocaleKeys
                          .onboarding_select_notification_time_dummy_notification_body,
                    ),
                    style: bodyM.copyWith(
                      color: context.textColorSecondary,
                      fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
