import 'package:flutter/material.dart';

class CommonDismissOnTap extends StatelessWidget {
  const CommonDismissOnTap({
    super.key,
    required this.dismiss,
    required this.child,
  });

  final VoidCallback dismiss;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismiss,
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
