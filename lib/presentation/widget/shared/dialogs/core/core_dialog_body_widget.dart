import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_button_widget.dart';
import 'package:denwee/presentation/widget/shared/dialogs/core/core_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoreDialogBody extends StatelessWidget {
  const CoreDialogBody(this.title, this.subtitle, {super.key});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Text(
            title!,
            style: dialogTitle.copyWith(color: context.textColor),
            textAlign: TextAlign.center,
          ),
          12.verticalSpace,
          Text(
            subtitle!,
            style: dialogSubtitle.copyWith(color: context.textColorSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CoreDialogButtons extends StatelessWidget {
  const CoreDialogButtons({
    super.key,
    required this.type,
    this.okButton,
    this.cancelButton,
  });

  final CoreDialogType type;
  final CoreDialogButton? okButton;
  final CoreDialogButton? cancelButton;

  @override
  Widget build(BuildContext context) {
    if (type == CoreDialogType.info) {
      if (okButton == null) return const SizedBox.shrink();

      return _DialogIconButton(button: okButton!);
    }

    return Row(
      children: [
        if (cancelButton != null)
          Expanded(child: _DialogIconButton(button: cancelButton!)),
        if (okButton != null)
          Expanded(child: _DialogIconButton(button: okButton!)),
      ],
    );
  }
}

class _DialogIconButton extends StatelessWidget {
  const _DialogIconButton({required this.button});

  final CoreDialogButton button;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      vertical: CoreDialog.buttonsVerticalPadding,
      horizontal: 24.w,
    );

    final Widget content;

    if (button.isCross) {
      content = AppBackButton(
        size: 20,
        type: AppBackButtonType.cross,
        padding: padding,
        onTap: button.onTap,
        color: button.color ?? context.iconColorSecondary,
      );
    } else {
      content = AppIconButton(
        size: button.size,
        onTap: button.onTap,
        padding: padding,
        iconPath: button.icon,
        color: button.color ?? context.theme.colorScheme.secondary,
      );
    }

    return Center(child: content);
  }
}
