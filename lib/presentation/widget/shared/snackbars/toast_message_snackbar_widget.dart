import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastMessageSnackbar extends StatelessWidget {
  const ToastMessageSnackbar(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Material(
        type: MaterialType.transparency,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            color: context.primaryContainer,
            shape: const RoundedSuperellipseBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              side: BorderSide(color: AppColors.white06),
            ),
            shadows: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 20.0),
                spreadRadius: -20,
                blurRadius: 25,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 26.w,
                    height: 26.w,
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
                  10.horizontalSpace,
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
