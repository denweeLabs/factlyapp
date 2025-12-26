import 'package:denwee/core/misc/domain/entity/app_language.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/widgets_util.dart';
import 'package:denwee/core/ui/widget/animations/tap_animations/bounce_tap_fade_animation.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/common/common_app_bar_widget.dart';
import 'package:denwee/core/ui/widget/common/common_body_appear_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  static const routeName = 'ChangeLanguagePage';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      iconPath: AppConstants.assets.icons.globeLinear,
      body: Column(
        children: [
          CommonAppBar(
            backgroundColor: Colors.transparent,
            title: context
                .tr(LocaleKeys.account_section_preferences_items_language),
          ),
          Expanded(
            child: FadingEdge(
              axis: Axis.vertical,
              stops: const [0.0, 0.03, 0.9, 1.0],
              child: CommonPageBodyAppear(
                child: ListView.separated(
                  itemCount: context.supportedLocales.length,
                  padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(
                    bottom: context.bottomPadding + 24.h,
                    top: 28.h,
                  ),
                  separatorBuilder: (_, _) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: const Divider(height: 0.0),
                  ),
                  itemBuilder: (context, index) {
                    final locale = context.supportedLocales[index];
                    final language = AppConstants.config.languages
                        .firstWhereOrNull(
                            (language) => language.locale == locale);
                    final isSelected = locale == context.locale;

                    if (language == null) return const SizedBox.shrink();

                    return _buildItem(
                      context: context,
                      language: language,
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required AppLanguage language,
    required bool isSelected,
  }) {
    return BounceTapFadeAnimation(
      minScale: 0.96,
      onTap: () => getIt<UserPreferencesCubit>().changeLanguage(language.locale),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  language.nativeName,
                  style: h4.copyWith(color: context.textColor),
                ),
                2.verticalSpace,
                Text(
                  language.englishName,
                  style: bodyM.copyWith(color: context.textColorSecondary),
                ),
              ],
            ),
          ),
          WidgetsUtil.staticRepaintAnimatedCrossFade(
            state: isSelected
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: BackdropSurfaceContainer.circle(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonAppIcon(
                  path: AppConstants.assets.icons.checkmarkLinear,
                  color: context.theme.colorScheme.secondary,
                  size: 20,
                ),
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
