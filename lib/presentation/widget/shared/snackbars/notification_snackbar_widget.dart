import 'package:denwee/core/notifications/domain/entity/push_notification.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/snackbars/core_global_snackbar_widget.dart';
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
      child: PhysicalShape(
        clipper: CoreSnackbar.clipper,
        color: context.primaryContainer,
        shadowColor: Colors.black54,
        elevation: 6.0,
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
