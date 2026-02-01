import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastMessageSnackbar extends StatelessWidget {
  const ToastMessageSnackbar(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: 0.41.sw,
          decoration: ShapeDecoration(
            color: context.primaryContainer,
            shape: const RoundedSuperellipseBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            shadows: [
              BoxShadow(
                color: context.theme.colorScheme.primary,
                offset: const Offset(0.0, 20.0),
                spreadRadius: -25,
                blurRadius: 30,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(
                          AppConstants.assets.images.appBackgroundIcon,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Text(
                    message,
                    style: h6.copyWith(color: context.textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
