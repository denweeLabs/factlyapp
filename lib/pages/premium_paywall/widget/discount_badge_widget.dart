import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageDiscountBadge extends StatelessWidget {
  const PackageDiscountBadge({super.key, required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 3.h, 6.w, 3.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          '-$percent%',
          style: TextStyle(
            color: context.darkTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
