import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/common/common_dismiss_ontap_widget.dart';
import 'package:denwee/core/ui/widget/dialogs/core/core_dialog_widget.dart';
import 'package:denwee/core/ui/widget/inputs/app_input_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassEmailPromptDialog extends StatefulWidget {
  const ResetPassEmailPromptDialog({super.key, this.initialEmail});

  final Email? initialEmail;

  static const routeName = 'ResetPassEmailPromptDialog';

  @override
  State<ResetPassEmailPromptDialog> createState() => _ResetPassEmailPromptDialogState();
}

class _ResetPassEmailPromptDialogState extends State<ResetPassEmailPromptDialog> {
  late final controller = TextEditingController();
  late final focusNode = FocusNode();

  late var email = widget.initialEmail ?? const Email.pure();

  @override
  void initState() {
    super.initState();
    if (widget.initialEmail != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.text = widget.initialEmail!.value;
      });
    } else {
      Future.delayed(CustomAnimationDurations.ultraLow, () {
        focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonDismissOnTap(
      dismiss: focusNode.unfocus,
      child: CoreDialog.confirmationWBody(
        dialogWidth: 0.9,
        horizontalPadding: 24,
        decorationIcon: AppConstants.assets.icons.smsLinear,
        cancelButton: CoreDialogButton.cross(Navigator.of(context).pop),
        okButton: CoreDialogButton(
          AppConstants.assets.icons.checkmarkLinear,
          _onSubmit,
          size: 26.0,
        ),
        body: Column(
          children: [
            Text(
              context.tr(LocaleKeys.dialog_reset_password_enter_email_title),
              style: h3.copyWith(color: context.textColor),
              textAlign: TextAlign.center,
            ),
            18.verticalSpace,
            Text(
              context.tr(LocaleKeys.dialog_reset_password_enter_email_subtitle),
              style: bodyM.copyWith(color: context.textColorTernary),
              textAlign: TextAlign.left,
            ),
            24.verticalSpace,
            Theme(
              data: context.theme.copyWith(shadowColor: Colors.transparent),
              child: AppInput(
                textInputType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                backgroundColor: context.secondaryContainer,
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                ).copyWith(left: 24.w, right: 8.w),
                suffixIcon: AppConstants.assets.icons.userSquareLinear,
                hint: context.tr(LocaleKeys.input_field_hint_email),
                controller: controller,
                focusNode: focusNode,
                onChanged: (value) {
                  email = Email.pure(value);
                },
              ),
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    if (email.isNotValid) {
      HapticUtil.heavy();
      AppDialogs.showErrorSnackbar(
        title: context.tr(LocaleKeys.label_oops),
        description: email.error?.errorName(context),
      );
    } else {
      Navigator.of(context).pop(email);
    }
  }
}
