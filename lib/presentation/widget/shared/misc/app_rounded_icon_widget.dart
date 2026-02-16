import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

class AppRoundedIcon extends StatelessWidget {
  const AppRoundedIcon({super.key, this.size, this.borderRadius});

  final Size? size;
  final BorderRadius? borderRadius;

  static const defaultSize = Size.square(48);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size ?? defaultSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            image: AssetImage(AppConstants.assets.images.appBackgroundIcon),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
