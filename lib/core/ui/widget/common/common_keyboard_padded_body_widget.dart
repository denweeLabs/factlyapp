import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/animations/animate_do/fade_in_up.dart';
import 'package:denwee/core/ui/widget/animations/constants/common_animation_values.dart';
import 'package:denwee/core/ui/widget/common/common_top_back_button_body_widget.dart';
import 'package:denwee/core/ui/widget/common/common_dismiss_ontap_widget.dart';
import 'package:denwee/core/ui/widget/misc/onscreen_button_keyboard_dismisser_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonKeyboardPaddedBody extends StatefulWidget {
  const CommonKeyboardPaddedBody({
    super.key,
    required this.title,
    required this.keyboardDismissAction,
    this.onBack,
    this.topPadding,
    this.bottomSectionPadding,
    this.bottomSection,
    required this.body,
    this.keyboardDismissButtonColor,
    this.keyboardDismissButtonHoverColor,
    this.showBackButton = true,
  });

  final String title;
  final VoidCallback keyboardDismissAction;
  final VoidCallback? onBack;
  final double? topPadding;
  final double? bottomSectionPadding;
  final Widget? bottomSection;
  final Widget body;
  final Color? keyboardDismissButtonColor;
  final Color? keyboardDismissButtonHoverColor;
  final bool showBackButton;

  static final titleSize = 42.sp;
  static final titleAndBodySpacing = 62.h;

  static const paddingAnimationCurve = Interval(0.0, 0.7, curve: Curves.easeOutSine);
  static const commonAnimationCurve = Interval(0.2, 1.0, curve: Curves.ease);

  @override
  State<CommonKeyboardPaddedBody> createState() =>
      _CommonKeyboardPaddedBodyState();
}

class _CommonKeyboardPaddedBodyState extends State<CommonKeyboardPaddedBody> {
  double? _bottomSectionPadding;

  @override
  Widget build(BuildContext context) {
    _bottomSectionPadding ??= widget.bottomSectionPadding;

    return CommonDismissOnTap(
      dismiss: widget.keyboardDismissAction,
      child: OnscreenButtonKeyboardDismisser(
        color: widget.keyboardDismissButtonColor,
        hoverColor: widget.keyboardDismissButtonHoverColor,
        customDismissAction: widget.keyboardDismissAction,
        builder: (context, isKeyboardVisible, bottomInset) {

          if (widget.showBackButton) {
            return CommonTopBackButtonBody(
              onBack: widget.onBack,
              hideBackButton: isKeyboardVisible,
              iconColor: context.lightIconColor,
              body: Stack(
                children: [
                  _buildBody(
                    context: context,
                    isKeyboardVisible: isKeyboardVisible,
                    bottomInset: bottomInset,
                  ),
                  if (widget.bottomSection != null &&
                      widget.bottomSectionPadding != null)
                    _buildBottomSection(
                      isKeyboardVisible: isKeyboardVisible,
                    ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              _buildBody(
                context: context,
                isKeyboardVisible: isKeyboardVisible,
                bottomInset: bottomInset,
              ),
              if (widget.bottomSection != null &&
                  widget.bottomSectionPadding != null)
                _buildBottomSection(
                  isKeyboardVisible: isKeyboardVisible,
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required bool isKeyboardVisible,
    required double bottomInset,
  }) {
    final hPadding = 24.w - (isKeyboardVisible ? 4.w : 0);
    final padding = EdgeInsets.fromLTRB(
      hPadding,
      widget.topPadding ?? 32.h,
      hPadding,
      CommonKeyboardPaddedBody.titleAndBodySpacing * 1.3 +
          CommonKeyboardPaddedBody.titleSize +
          bottomInset,
    );

    return AnimatedPadding(
      curve: Curves.easeOutExpo,
      duration: CustomAnimationDurations.low,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(
            context: context,
            isKeyboardVisible: isKeyboardVisible,
          ),
          SizedBox(
            height: CommonKeyboardPaddedBody.titleAndBodySpacing,
          ),
          widget.body,
        ],
      ),
    );
  }

  Widget _buildTitle({
    required BuildContext context,
    required bool isKeyboardVisible,
  }) {
    return AnimatedOpacity(
      curve: Curves.easeOutExpo,
      duration: CustomAnimationDurations.low,
      opacity: isKeyboardVisible ? 0.0 : 1.0,
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: h0.copyWith(
          fontSize: CommonKeyboardPaddedBody.titleSize,
          color: context.darkPrimaryContainer.withValues(alpha: 0.1),
        ),
      ).autoFadeInUp(sequencePos: 1),
    );
  }

  Widget _buildBottomSection({
    required bool isKeyboardVisible,
  }) {
    final bottom = _bottomSectionPadding! * (isKeyboardVisible ? -1 : 1);

    return AnimatedPositioned(
      left: 0.0,
      right: 0.0,
      bottom: bottom,
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: CustomAnimationDurations.lowMedium,
      child: widget.bottomSection!,
    );
  }
}
