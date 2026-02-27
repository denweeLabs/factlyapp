import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
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
  });

  final String? title;
  final String? description;
  final String? iconPath;
  final Color? backgroundColor;

  static const clipper = ShapeBorderClipper(
    shape: RoundedSuperellipseBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? context.primaryContainer;

    return Material(
      color: Colors.transparent,
      child: PhysicalShape(
        color: color,
        clipper: clipper,
        shadowColor: Colors.black54,
        elevation: 6.0,
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
