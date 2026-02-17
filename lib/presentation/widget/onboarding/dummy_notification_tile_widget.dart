import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/widget/shared/misc/app_rounded_icon_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DummyNotificationTile extends StatelessWidget {
  const DummyNotificationTile({super.key});

  static const borderRadius = BorderRadius.all(Radius.circular(28));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: _buildTileBody(context),
    );
  }

  Widget _buildTileBody(BuildContext context) {
    final borderColor = context.isLightTheme ? Colors.black12 : Colors.white10;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: borderRadius,
        color: context.primaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14.w, 10.h, 18.w, 10.h),
        child: Row(
          children: [
            const AppRoundedIcon(),
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
      ),
    );
  }
}
