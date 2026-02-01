import 'package:denwee/core/backgrounds/domain/entity/available_background.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_category.dart';
import 'package:denwee/core/backgrounds/domain/entity/background_selection_item.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/widget/buttons/icon_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_app_bar_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/available_backgrounds/util/background_selection_util.dart';
import 'package:denwee/pages/available_backgrounds/widget/background_selection_card_widget.dart';
import 'package:denwee/pages/available_backgrounds/widget/default_background_selection_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';
import 'package:utils/utils.dart';

class AvailableBackgroundsPage extends StatefulWidget {
  const AvailableBackgroundsPage({super.key, this.popToHome = false});

  final bool popToHome;

  static const routeName = 'AvailableBackgroundsPage';

  @override
  State<AvailableBackgroundsPage> createState() =>
      _AvailableBackgroundsPageState();
}

class _AvailableBackgroundsPageState extends State<AvailableBackgroundsPage> {
  static const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 2,
    crossAxisSpacing: 2,
    childAspectRatio: 0.75,
  );

  late final items = <BackgroundCategory, List<BackgroundSelectionItem>>{};

  @override
  void initState() {
    super.initState();
    final state = getIt<AvailableBackgroundsCubit>().state;
    if (state.backgrounds.isNotEmpty) {
      initItems();
    }
    if (state.failure.isSome()) {
      getIt<AvailableBackgroundsCubit>().checkBackgrounds();
    }
  }

  void initItems() {
    final cubitState = getIt<AvailableBackgroundsCubit>().state;
    final backgrounds = cubitState.backgrounds;
    if (backgrounds.isEmpty) return;

    final selectedBackgroundId = getIt<UserPreferencesCubit>()
        .state
        .preferences
        .background
        .selectedBackgroundId;

    final unlockedBackgroundIds =
        getIt<ProfileCubit>().state.profile
            .toNullable()
            ?.unlockedBackgrounds
            .toSet() ??
        <UniqueId>{};

    // 1. Extract selected background
    final selectedBackground = backgrounds.firstWhereOrNull(
      (b) => b.id == selectedBackgroundId,
    );

    // 2. Group all OTHER backgrounds by category
    final groupedByCategory = backgrounds
        .where((b) => b.id != selectedBackgroundId)
        .groupBy((b) => b.category)
        .entries
        .toList();

    if (groupedByCategory.isEmpty) return;

    // 3. Build final ordered category map
    items.clear();

    for (var i = 0; i < groupedByCategory.length; i++) {
      final entry = groupedByCategory[i];
      final isFirstCategory = i == 0;

      final categoryBackgrounds = <AvailableBackground>[
        if (isFirstCategory && selectedBackground != null) selectedBackground,
        ...entry.value,
      ];

      items[entry.key] = _buildCategoryItems(
        backgrounds: categoryBackgrounds,
        isFirstCategory: isFirstCategory,
        selectedBackgroundId: selectedBackgroundId,
        unlockedBackgroundIds: unlockedBackgroundIds,
      );
    }
  }

  bool _listener(AvailableBackgroundsState p, AvailableBackgroundsState c) {
    if (p.backgrounds.isEmpty && c.backgrounds.isNotEmpty) {
      initItems();
      setState(() {});
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AvailableBackgroundsCubit, AvailableBackgroundsState>(
      listener: (_, __) {},
      listenWhen: _listener,
      child: CommonPopScope(
        onWillPop: _goBack,
        child: CommonScaffold(
          iconPath: AppConstants.assets.icons.galleryLinear,
          body: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    for (var i = 0; i < items.length; i++) ...[
                      ..._buildCategoryGroup(
                        entry: items.entries.toList()[i],
                        isLastCategory: i == items.length - 1,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return CommonAppBar(
      onBack: _goBack,
      backgroundColor: Colors.transparent,
      title: context.tr(LocaleKeys.account_section_background_title),
      action: BackgroundSelectionUtil.isSubscribedProvider(
        builder: (isSubscribed) => isSubscribed
            ? const SizedBox.shrink()
            : AppIconButton(
                onTap: () => context.restorablePushNamedArgs(
                  Routes.premiumPaywall,
                  rootNavigator: true,
                ),
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                iconPath: AppConstants.assets.icons.unlockLinear,
                color: context.iconColor,
              ),
      ),
    );
  }

  List<Widget> _buildCategoryGroup({
    required MapEntry<BackgroundCategory, List<BackgroundSelectionItem>> entry,
    required bool isLastCategory,
  }) {
    return [
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
      
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            entry.key.title,
            style: h2.copyWith(
              color: context.textColor,
              fontWeight: FontWeight.w700,
              fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
            ),
          ),
        ),
      ),

      const SliverToBoxAdapter(child: SizedBox(height: 16)),

      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        sliver: SliverGrid(
          gridDelegate: gridDelegate,
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = entry.value[index];
            return BackgroundSelectionUtil.isBackgroundItemSelected(
              item: item,
              builder: (isSelected) => _buildGridItem(item, isSelected),
            );
          }, childCount: entry.value.length),
        ),
      ),

      if (isLastCategory)
        SliverToBoxAdapter(child: SizedBox(height: context.bottomPadding + 12.h)),
    ];
  }

  Widget _buildGridItem(BackgroundSelectionItem item, bool isSelected) {
    return item.when(
      defaultBackground: () =>
          DefaultBackgroundSelectionCard(isSelected: isSelected),
      availableBackground: (background) => BackgroundSelectionCard(
        forceOpenEdit: true,
        isSelected: isSelected,
        background: background,
      ),
    );
  }

  List<BackgroundSelectionItem> _buildCategoryItems({
    required List<AvailableBackground> backgrounds,
    required bool isFirstCategory,
    required UniqueId selectedBackgroundId,
    required Set<UniqueId> unlockedBackgroundIds,
  }) {
    final defaultId = AppConstants.config.defaultBackgroundId;

    final selected = <BackgroundSelectionItem>[];
    final defaults = <BackgroundSelectionItem>[];
    final freeUnlocked = <BackgroundSelectionItem>[];
    final others = <BackgroundSelectionItem>[];

    for (final bg in backgrounds) {
      final isSelected = bg.id == selectedBackgroundId;
      final isFreeOrUnlocked =
          bg.isFree || unlockedBackgroundIds.contains(bg.id);

      if (isFirstCategory && isSelected) {
        selected.add(BackgroundSelectionItem.availableBackground(bg));
      } else if (isFreeOrUnlocked) {
        freeUnlocked.add(BackgroundSelectionItem.availableBackground(bg));
      } else {
        others.add(BackgroundSelectionItem.availableBackground(bg));
      }
    }

    if (isFirstCategory) {
      if (selectedBackgroundId == defaultId) {
        selected.insert(0, const BackgroundSelectionItem.defaultBackground());
      } else {
        defaults.add(const BackgroundSelectionItem.defaultBackground());
      }

      return [...selected, ...defaults, ...freeUnlocked, ...others];
    }

    return [...freeUnlocked, ...others];
  }

  void _goBack() {
    if (!widget.popToHome) return Navigator.of(context).pop();
    context.restorablePushReplacementNamedArgs(Routes.home);
  }
}
