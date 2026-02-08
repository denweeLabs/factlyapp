import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/widget/backgrounds/background_selection_card_body_widget.dart';
import 'package:flutter/material.dart';

class DefaultBackgroundSelectionCard extends StatelessWidget {
  const DefaultBackgroundSelectionCard({super.key, required this.isSelected});

  static const imageCacheWidth = 100;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BackgroundSelectionCardBody(
      onTap: _onCardTap,
      onLongTap: () {},
      id: AppConstants.config.defaultBackgroundId,
      lettersStyle: factShortContent.copyWith(color: context.lightTextColor),
      isSelected: isSelected,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildImage(AppConstants.assets.images.interest(11)),
          _buildImage(AppConstants.assets.images.interest(3)),
          _buildImage(AppConstants.assets.images.interest(4)),
          _buildImage(AppConstants.assets.images.interest(1)),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    return Image.asset(path, cacheWidth: imageCacheWidth, fit: BoxFit.cover);
  }

  void _onCardTap() {
    getIt<ActiveBackgroundCubit>().applyDefaultBackground();
  }
}
