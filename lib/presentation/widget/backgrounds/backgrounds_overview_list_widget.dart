import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_selection_item.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/page/available_backgrounds/util/background_selection_util.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/backgrounds/background_selection_card_body_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/background_selection_card_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/default_background_selection_card_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/surface_container_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class BackgroundsOverviewList extends StatefulWidget {
  const BackgroundsOverviewList({
    super.key,
    this.padding,
    this.clipBorderRadius = const BorderRadius.horizontal(
      right: Radius.circular(30),
    ),
    this.size = defaultSize,
    this.onlyUnlockedBackgrounds = false,
    this.maxVisibleCount = 15,
    this.viewAllCardVisible = false,
  });

  final EdgeInsets? padding;
  final BorderRadius clipBorderRadius;
  final bool onlyUnlockedBackgrounds;
  final int maxVisibleCount;
  final bool viewAllCardVisible;
  final Size size;

  static const defaultSize = Size(
    BackgroundSelectionCardBody.defaultWidth,
    160,
  );

  @override
  State<BackgroundsOverviewList> createState() =>
      _BackgroundsOverviewListState();
}

class _BackgroundsOverviewListState extends State<BackgroundsOverviewList> {
  late final items = <BackgroundSelectionItem>[];

  @override
  void initState() {
    super.initState();
    initItems();
  }

  void initItems() {
    final backgrounds = getIt<AvailableBackgroundsCubit>().state.backgrounds;
    final selectedBackgroundId = getIt<UserPreferencesCubit>()
        .state
        .preferences
        .background
        .selectedBackgroundId;
    final unlockedBackgroundIds = getIt<ProfileCubit>().state.profile
        .toNullable()!
        .unlockedBackgrounds;
    
    if (backgrounds.isEmpty) return;

    items.addAll(
      _buildOrderedBackgroundItems(
        backgrounds: backgrounds,
        selectedBackgroundId: selectedBackgroundId,
        unlockedBackgroundIds: unlockedBackgroundIds,
      ),
    );
  }

  bool _backgroundsListener(AvailableBackgroundsState p, AvailableBackgroundsState c) {
    if (p.backgrounds.isEmpty && c.backgrounds.isNotEmpty && items.isEmpty) {
      initItems();
      setState(() {});
    }
    return false;
  }

  bool _activeBackgroundListener(
    ActiveBackgroundState p,
    ActiveBackgroundState c,
  ) {
    if (p.isApplying && !c.isApplying && c.isApplied) {
      c.maybeWhen(
        applied: (isPurchasedViaStars, _) {
          if (isPurchasedViaStars) return;
          context.restorablePushReplacementNamedArgs(
            Routes.homeCrossFade,
            rootNavigator: true,
          );
        },
        orElse: () {},
      );
    }
    
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ActiveBackgroundCubit, ActiveBackgroundState>(
      listener: (_, __) {},
      listenWhen: _activeBackgroundListener,
      child: BlocListener<AvailableBackgroundsCubit, AvailableBackgroundsState>(
        listener: (_, __) {},
        listenWhen: _backgroundsListener,
        child: SizedBox.fromSize(
          size: Size.fromHeight(widget.size.height),
          child: ClipRSuperellipse(
            borderRadius: widget.clipBorderRadius,
            child: _buildScrollableList(),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableList() {
    final length = widget.viewAllCardVisible ? items.length + 1 : items.length;
    
    return BackgroundCardSelectionProviders(
      builder: (context, vm) => ListView.builder(
        itemCount: length,
        padding: widget.padding ?? EdgeInsets.only(left: 18.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (widget.viewAllCardVisible && index == length - 1) {
            return _buildViewAllCard();
          }
          
          final item = items[index];

          return RepaintBoundary(
            child: _cardWidgetBuilder(item: item, vm: vm),
          );
        },
      ),
    );
  }

  Widget _cardWidgetBuilder({
    required BackgroundSelectionItem item,
    required BackgroundCardSelectionVM vm,
  }) {
    final isSelected = item.isSelected(vm.selectedId);
    final isApplying = item.id == vm.applyingId;
    
    return item.when(
      defaultBackground: () => DefaultBackgroundSelectionCard(
        isSelected: isSelected,
        isApplying: isApplying,
        width: widget.size.width,
      ),
      availableBackground: (background) => BackgroundSelectionCard(
        background: background,
        isSelected: isSelected,
        isApplying: isApplying,
        isSubscribed: vm.hasPremiumSubscription,
        isUnlocked: vm.unlockedIds.contains(background.id),
        width: widget.size.width,
      ),
    );
  }

  Widget _buildViewAllCard() {
    return SizedBox.fromSize(
      size: Size.fromWidth(widget.size.width),
      child: Padding(
        padding: BackgroundSelectionCardBody.padding,
        child: SurfaceContainer.ellipse(
          onTap: () => context.restorablePushNamedArgs(
            Routes.availableBackgrounds,
            rootNavigator: true,
          ),
          color: context.primaryContainer,
          hoverColor: context.primaryContainer,
          borderColor: context.theme.dividerColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonAppIcon(
                  path: AppConstants.assets.icons.arrowRightAndroid,
                  color: context.iconColorSecondary,
                  size: 24,
                ),
                4.verticalSpace,
                Text(
                  context.tr(LocaleKeys.account_section_background_more),
                  style: h6.copyWith(color: context.textColorSecondary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds ordered list of background items for overview
  /// Rules:
  /// 1. Selected background
  /// 2. Unlocked backgrounds
  /// 3. Default background (if not selected)
  /// 4. Free backgrounds (price == 0)
  List<BackgroundSelectionItem> _buildOrderedBackgroundItems({
    required List<AvailableBackground> backgrounds,
    required UniqueId selectedBackgroundId,
    required Set<UniqueId> unlockedBackgroundIds,
  }) {
    final defaultBackgroundId = AppConstants.config.defaultBackgroundId;

    // index available backgrounds by id
    final byId = {for (final bg in backgrounds) bg.id: bg};

    final ordered = <BackgroundSelectionItem>[];

    // 1. Selected background
    if (selectedBackgroundId == defaultBackgroundId) {
      ordered.add(const BackgroundSelectionItem.defaultBackground());
    } else {
      final selectedBg = byId[selectedBackgroundId];
      if (selectedBg != null) {
        ordered.add(BackgroundSelectionItem.availableBackground(selectedBg));
      }
    }

    // 2. Unlocked backgrounds (excluding selected)
    for (final id in unlockedBackgroundIds) {
      if (id == selectedBackgroundId) continue;

      final bg = byId[id];
      if (bg != null) {
        ordered.add(BackgroundSelectionItem.availableBackground(bg));
      }
    }

    // 3. Default background (if not selected)
    if (selectedBackgroundId != defaultBackgroundId) {
      ordered.add(const BackgroundSelectionItem.defaultBackground());
    }

    // Track added available background IDs
    final addedIds = <UniqueId>{
      ...ordered.whereType<Available>().map((e) => e.background.id),
    };

    // 4. Free backgrounds (price == 0)
    for (final bg in backgrounds) {
      if (bg.price > 0) continue;
      if (addedIds.contains(bg.id)) continue;

      ordered.add(BackgroundSelectionItem.availableBackground(bg));
      addedIds.add(bg.id);
    }

    // 5. Rest backgrounds (everything else)
    if (!widget.onlyUnlockedBackgrounds) {
      for (final bg in backgrounds) {
        if (addedIds.contains(bg.id)) continue;

        ordered.add(BackgroundSelectionItem.availableBackground(bg));
      }
    }

    // return ordered backgrounds
    return ordered.take(widget.maxVisibleCount).toList();
  }
}
