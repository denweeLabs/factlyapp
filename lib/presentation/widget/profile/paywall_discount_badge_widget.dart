import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaywallPackageDiscountBadge extends StatelessWidget {
  const PaywallPackageDiscountBadge(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.w, 3.h, 6.w, 3.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          message.toUpperCase(),
          style: TextStyle(
            color: context.darkTextColor,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
