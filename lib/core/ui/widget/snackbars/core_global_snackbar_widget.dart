import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalSnackbarController {
  GlobalSnackbarController._();

  static final instance = GlobalSnackbarController._();

  final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();

  void show(OverlayEntry entry) {
    overlayKey.currentState?.insert(entry);
  }

  void remove(OverlayEntry entry) {
    entry.remove();
  }
}

class GlobalSnackbarInjector extends StatelessWidget {
  final Widget child;

  const GlobalSnackbarInjector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Overlay(
      key: GlobalSnackbarController.instance.overlayKey,
      initialEntries: [OverlayEntry(builder: (context) => child)],
    );
  }
}

class CoreSnackbar extends StatelessWidget {
  const CoreSnackbar({
    super.key,
    this.title,
    this.description,
    this.iconPath,
    this.backgroundColor,
    // this.secondaryBackgroundColor,
  });

  final String? title;
  final String? description;
  final String? iconPath;
  final Color? backgroundColor;
  // final Color? secondaryBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? context.primaryContainer;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor,
              offset: const Offset(0.0, 4.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            if (iconPath != null)
              Positioned(
                right: -14.w,
                bottom: -14.w,
                child: CommonAppIcon(
                  path: iconPath!,
                  size: 98,
                  color: context.darkPrimaryContainer.withValues(
                    alpha: .08,
                  ),
                ),
              ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                        title!,
                        style: h5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (description != null) 4.verticalSpace,
                    ],
                    if (description != null)
                      Text(
                        description!,
                        style: bodyM.copyWith(
                          color: title != null ? Colors.white70 : Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
