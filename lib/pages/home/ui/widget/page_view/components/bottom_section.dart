import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({
    required this.onAccountTap,
    required this.onReadMoreTap,
    required this.isLoading,
    super.key,
  });

  final VoidCallback onAccountTap;
  final VoidCallback onReadMoreTap;
  final bool isLoading;

  static final buttonsHeight = 62.h;
  static final containerHeight = buttonsHeight + (24.h * 2);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BackdropSurfaceContainer.ellipse(
        color: context.lightSurfaceContainer,
        borderRadius: BorderRadius.all(Radius.circular(38.r)),
        size: Size.fromHeight(BottomSection.containerHeight),
        borderColor: Colors.white10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
          child: Row(
            children: [
              RepaintBoundary(
                child: BackdropSurfaceContainer.circle(
                  onTap: onAccountTap,
                  borderColor: Colors.white30,
                  size: Size.square(BottomSection.buttonsHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CommonAppIcon(
                        path: AppConstants.assets.icons.userLinear,
                        color: context.lightIconColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              18.horizontalSpace,
              Expanded(
                child: RepaintBoundary(
                  child: AppSolidButton(
                    isBubbles: true,
                    isShimmering: true,
                    text: context.tr(LocaleKeys.button_explain_fact),
                    buttonHeight: BottomSection.buttonsHeight,
                    isBusy: isLoading,
                    onTap: onReadMoreTap,
                    hideShadow: true,
                  ),
                ),
              ),
              4.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
