import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_selection_item.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/page/available_backgrounds/util/background_selection_util.dart';
import 'package:denwee/presentation/widget/backgrounds/background_selection_card_widget.dart';
import 'package:denwee/presentation/widget/backgrounds/default_background_selection_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class BackgroundsOverviewList extends StatefulWidget {
  const BackgroundsOverviewList({super.key});

  static final height = 160.w;
  static const maxVisibleCount = 15;

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
    if (backgrounds.isEmpty) return;

    final selectedBackgroundId = getIt<UserPreferencesCubit>()
        .state
        .preferences
        .background
        .selectedBackgroundId;
    final unlockedBackgroundIds =
        getIt<ProfileCubit>().state.profile.toNullable()?.unlockedBackgrounds ??
        [];

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
          size: Size.fromHeight(BackgroundsOverviewList.height),
          child: ClipRSuperellipse(
            borderRadius: BorderRadius.horizontal(
              right: AppConstants.style.radius.cardMedium,
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(left: 18.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = items[index];
                
                return BackgroundSelectionUtil.isBackgroundItemSelected(
                  item: item,
                  builder: (isSelected) => RepaintBoundary.wrap(
                    _cardWidgetBuilder(item, isSelected),
                    index,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardWidgetBuilder(BackgroundSelectionItem item, bool isSelected) {
    return item.when(
      defaultBackground: () => DefaultBackgroundSelectionCard(isSelected: isSelected),
      availableBackground: (background) => BackgroundSelectionCard(
        isSelected: isSelected,
        background: background,
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
    required List<UniqueId> unlockedBackgroundIds,
  }) {
    final defaultBackgroundId = AppConstants.config.defaultBackgroundId;
    final unlockedIds = unlockedBackgroundIds.toSet();

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
    for (final id in unlockedIds) {
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
    for (final bg in backgrounds) {
      if (addedIds.contains(bg.id)) continue;

      ordered.add(BackgroundSelectionItem.availableBackground(bg));
    }

    // return ordered backgrounds
    return ordered.take(BackgroundsOverviewList.maxVisibleCount).toList();
  }
}
