import 'package:denwee/core/notifications/domain/entity/push_notification.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSnackbar extends StatelessWidget {
  const NotificationSnackbar(this.notification, {super.key});

  final PushNotification notification;

  @override
  Widget build(BuildContext context) {
    final title = notification.title.toNullable();
    final body = notification.body.toNullable();
    final fontFamily = 'Manrope';

    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          color: context.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
          boxShadow: [AppConstants.style.colors.commonShadow],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(14.w, 8.h, 18.w, 8.h),
            child: Row(
              children: [
                Container(
                  width: 46.w,
                  height: 46.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(
                        AppConstants.assets.images.appBackgroundIcon,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                14.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null) ...[
                        Text(
                          title,
                          style: h6.copyWith(
                            color: context.textColor,
                            fontFamily: fontFamily,
                          ),
                        ),
                        if (body != null) 2.verticalSpace,
                      ],
                      if (body != null)
                        Text(
                          body,
                          style: bodyM.copyWith(
                            color: title != null
                                ? context.textColorSecondary
                                : context.textColor,
                            fontFamily: fontFamily,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
