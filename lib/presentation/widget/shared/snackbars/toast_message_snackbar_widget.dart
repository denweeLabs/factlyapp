import 'package:denwee/presentation/shared/theme/app_colors.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/misc/app_rounded_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastMessageSnackbar extends StatelessWidget {
  const ToastMessageSnackbar(this.message, {super.key});

  final String message;

  static const shape = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
    side: BorderSide(color: AppColors.white06),
  );

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: PhysicalShape(
        elevation: 10.0,
        shadowColor: Colors.black87,
        clipper: ShapeBorderClipper(shape: shape),
        color: context.primaryContainer,
        child: DecoratedBox(
          decoration: ShapeDecoration(shape: shape),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppRoundedIcon(
                    size: Size.square(26),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  10.horizontalSpace,
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      message,
                      style: h6.copyWith(color: context.textColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
