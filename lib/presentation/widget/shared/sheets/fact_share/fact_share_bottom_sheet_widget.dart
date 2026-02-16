import 'dart:io';

import 'package:denwee/core/facts/domain/util/share/fact_share_util.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/bloc/facts/fact_share_cubit.dart';
import 'package:denwee/presentation/bloc/facts/facts_archive_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/launcher_util.dart';
import 'package:denwee/presentation/widget/shared/animations/constants/common_animation_values.dart';
import 'package:denwee/presentation/widget/shared/buttons/back_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/sheets/fact_share/fact_copy_button_widget.dart';
import 'package:denwee/presentation/widget/shared/sheets/fact_share/fact_share_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_sheets/smooth_sheets.dart';
import 'package:utils/utils.dart';

enum FactShareSupportedTarget {
  instagramStories,
  whatsapp,
  telegram,
  viber,
  facebook,
  instagramDirect,
  instagram,
  more,
  download,
}

class FactShareBottomSheet extends StatefulWidget {
  const FactShareBottomSheet({
    super.key,
    required this.website,
    required this.factId,
    required this.factContent,
  });

  final NetworkLink? website;
  final UniqueId factId;
  final String factContent;

  static const routeName = 'FactShareBottomSheet';

  static Future<void> show(
    BuildContext context, {
    required NetworkLink? website,
    required UniqueId factId,
    required String factContent,
  }) async {
    return showModalSheet<void>(
      context: context,
      swipeDismissible: true,
      barrierColor: Colors.black38,
      transitionDuration: CustomAnimationDurations.ultraLow,
      transitionCurve: Curves.fastEaseInToSlowEaseOut,
      routeSettings: const RouteSettings(name: FactShareBottomSheet.routeName),
      builder: (_) => FactShareBottomSheet(
        factId: factId,
        website: website,
        factContent: factContent,
      ),
    );
  }

  static const shape = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
  );

  static const instagramGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFEDA75), // Yellow
      Color(0xFFFA7E1E), // Orange
      Color(0xFFD62976), // Pink
      Color(0xFF962FBF), // Purple
      Color(0xFF4F5BD5), // Blue
    ],
  );

  @override
  State<FactShareBottomSheet> createState() => _FactShareBottomSheetState();
}

class _FactShareBottomSheetState extends State<FactShareBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Sheet(
      decoration: MaterialSheetDecoration(
        size: SheetSize.stretch,
        color: context.primaryContainer,
        shape: FactShareBottomSheet.shape,
      ),
      child:
          BlocSelector<
            FactShareCubit,
            FactShareState,
            FactShareSupportedTarget?
          >(
            selector: (state) => state.sharingTarget.toNullable(),
            builder: (context, loadingTarget) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(loadingTarget),
                _buildSocialRow(loadingTarget),
                8.verticalSpace,
                _buildActionRow(loadingTarget),
                _buildBottomInset(context),
              ],
            ),
          ),
    );
  }

  Widget _buildBottomInset(BuildContext context) {
    final bottomPadding = context.bottomPadding;
    final hasBottomPadding = bottomPadding > 0;
    final inset = Platform.isIOS
        ? hasBottomPadding
              ? bottomPadding * 0.8
              : 14.h
        : hasBottomPadding
        ? bottomPadding + 8.h
        : 16.h;
    return SizedBox(height: inset);
  }

  Widget _buildHeader(FactShareSupportedTarget? loadingTarget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 50.w),
        Container(
          width: 30,
          height: 3,
          color: context.iconColor.withValues(alpha: 0.25),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AppBackButton(
            size: 18,
            color: context.iconColorTernary,
            type: AppBackButtonType.cross,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            onTap: () {
              if (loadingTarget != null) return;
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSocialRow(FactShareSupportedTarget? loadingTarget) {
    return _HorizontalRow(
      children: [
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.instagramStories,
          onTap: () => _onOptionTap(FactShareSupportedTarget.instagramStories),
          label: 'Stories',
          decoration: BoxDecoration(
            gradient: FactShareBottomSheet.instagramGradient,
          ),
          child: CommonAppIcon(
            path: AppConstants.assets.icons.igStoryLinear,
            color: context.lightIconColor,
            size: 26,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.whatsapp,
          onTap: () => _onOptionTap(FactShareSupportedTarget.whatsapp),
          label: 'WhatsApp',
          child: CommonAppIcon(
            path: AppConstants.assets.icons.whatsapp,
            ignoreIconColor: true,
            size: 100,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.telegram,
          onTap: () => _onOptionTap(FactShareSupportedTarget.telegram),
          label: 'Telegram',
          child: CommonAppIcon(
            path: AppConstants.assets.icons.telegram,
            ignoreIconColor: true,
            size: 100,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.viber,
          onTap: () => _onOptionTap(FactShareSupportedTarget.viber),
          label: 'Viber',
          child: CommonAppIcon(
            path: AppConstants.assets.icons.viber,
            ignoreIconColor: true,
            size: 100,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.facebook,
          onTap: () => _onOptionTap(FactShareSupportedTarget.facebook),
          label: 'Facebook',
          child: CommonAppIcon(
            path: AppConstants.assets.icons.facebook,
            ignoreIconColor: true,
            size: 100,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.instagramDirect,
          onTap: () => _onOptionTap(FactShareSupportedTarget.instagramDirect),
          label: 'Direct',
          decoration: BoxDecoration(
            gradient: FactShareBottomSheet.instagramGradient,
          ),
          child: CommonAppIcon(
            path: AppConstants.assets.icons.igDirectLinear,
            color: context.lightIconColor,
            size: 26,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.instagram,
          onTap: () => _onOptionTap(FactShareSupportedTarget.instagram),
          label: 'Instagram',
          decoration: BoxDecoration(
            gradient: FactShareBottomSheet.instagramGradient,
          ),
          child: CommonAppIcon(
            path: AppConstants.assets.icons.igLinear,
            color: context.lightIconColor,
            size: 22,
          ),
        ),
        FactShareButton(
          clipBehavior: Clip.hardEdge,
          isLoading: loadingTarget == FactShareSupportedTarget.more,
          onTap: () => _onOptionTap(FactShareSupportedTarget.more),
          label: context.tr(LocaleKeys.fact_share_more),
          decoration: const BoxDecoration(color: Color(0xFF3EA5FF)),
          child: CommonAppIcon(
            path: AppConstants.assets.icons.threeDotsHorizontalBold,
            color: context.lightIconColor,
            size: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow(FactShareSupportedTarget? loadingTarget) {
    return _HorizontalRow(
      children: [
        BlocSelector<UserSubscriptionCubit, UserSubscriptionState, bool>(
          selector: (state) => state.isSubscribed,
          builder: (context, isSubscribed) {
            if (isSubscribed) return const SizedBox.shrink();

            return FactShareButton(
              onTap: () => context.restorablePushNamedArgs(
                Routes.premiumPaywall,
                rootNavigator: true,
              ),
              label: context.tr(LocaleKeys.fact_share_hide_watermark),
              child: CommonAppIcon(
                path: AppConstants.assets.icons.eyeSlashLinear,
                size: 20,
              ),
            );
          },
        ),
        BlocSelector<FactsArchiveCubit, FactsArchiveState, bool>(
          selector: (state) => state.isArchived(widget.factId),
          builder: (context, isArchived) {
            return FactShareButton(
              onTap: () => isArchived
                  ? getIt<FactsArchiveCubit>().remove(widget.factId)
                  : getIt<FactsArchiveCubit>().add(widget.factId),
              label: isArchived
                  ? context.tr(LocaleKeys.fact_share_archive_unarchive)
                  : context.tr(LocaleKeys.fact_share_archive_archive),
              child: CommonAppIcon(
                path: isArchived
                    ? AppConstants.assets.icons.archiveTickBold
                    : AppConstants.assets.icons.archiveTickLinear,
                size: 20,
              ),
            );
          },
        ),
        FactShareCopyButton(text: widget.factContent),
        FactShareButton(
          isLoading: loadingTarget == FactShareSupportedTarget.download,
          onTap: () => _onOptionTap(FactShareSupportedTarget.download),
          label: context.tr(LocaleKeys.fact_share_download_download),
          child: CommonAppIcon(
            path: AppConstants.assets.icons.documentDownloadLinear,
            size: 20,
          ),
        ),
        if (widget.website != null)
          FactShareButton(
            onTap: () => LauncherUtil.launchUrl(
              widget.website!.value,
              linkType: LinkLaunchType.domain,
            ),
            label: context.tr(LocaleKeys.fact_share_resource),
            child: CommonAppIcon(
              path: AppConstants.assets.icons.globeLinear,
              size: 20,
            ),
          ),
      ],
    );
  }

  void _onOptionTap(FactShareSupportedTarget target) {
    getIt<FactShareCubit>()
        .share(target)
        .then(
          (fileOption) => fileOption.fold(
            () {},
            (file) => getIt<FactShareUtil>().share(
              context: context,
              target: target,
              file: file,
            ),
          ),
        );
  }
}

class _HorizontalRow extends StatelessWidget {
  const _HorizontalRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FactShareButton.size.height,
      child: ListView.builder(
        itemCount: children.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        itemBuilder: (context, index) => children[index],
      ),
    );
  }
}
