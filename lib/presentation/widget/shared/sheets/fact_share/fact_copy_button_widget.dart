import 'dart:async';

import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/sheets/fact_share/fact_share_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FactShareCopyButton extends StatefulWidget {
  const FactShareCopyButton({super.key, required this.text});

  final String text;

  @override
  State<FactShareCopyButton> createState() => _FactShareCopyButtonState();
}

class _FactShareCopyButtonState extends State<FactShareCopyButton> {
  static const iconChangeDuration = Duration(milliseconds: 2000);

  bool _isCopied = false;
  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  Future<void> _handleCopy() async {
    if (_isCopied) return;

    final clipboardData = ClipboardData(text: widget.text);
    unawaited(Clipboard.setData(clipboardData));

    setState(() => _isCopied = true);

    AppDialogs.showToastMessage(
      context.tr(LocaleKeys.fact_share_copy_copied),
    );

    _resetTimer?.cancel();
    _resetTimer = Timer(iconChangeDuration, () {
      if (!mounted) return;

      setState(() => _isCopied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = _isCopied
        ? AppConstants.assets.icons.copySuccessLinear
        : AppConstants.assets.icons.copyLinear;

    return FactShareButton(
      onTap: _handleCopy,
      label: context.tr(LocaleKeys.fact_share_copy_copy),
      child: CommonAppIcon(path: iconPath, size: 20),
    );
  }
}
