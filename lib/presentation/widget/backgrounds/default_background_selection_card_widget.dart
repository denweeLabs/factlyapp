import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/widget/backgrounds/background_selection_card_body_widget.dart';
import 'package:flutter/material.dart';

class DefaultBackgroundSelectionCard extends StatelessWidget {
  const DefaultBackgroundSelectionCard({
    super.key,
    required this.isSelected,
    required this.isApplying,
    this.width = BackgroundSelectionCardBody.defaultWidth,
  });

  static const imageCacheWidth = 100;

  final bool isSelected;
  final bool isApplying;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BackgroundSelectionCardBody(
      width: width,
      onTap: _onCardTap,
      onLongTap: () {},
      isApplying: isApplying,
      lettersStyle: factShortContent.copyWith(color: context.lightTextColor),
      isSelected: isSelected,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildImage(AppConstants.assets.images.interest(11)),
                _buildImage(AppConstants.assets.images.interest(3)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _buildImage(AppConstants.assets.images.interest(6)),
                _buildImage(AppConstants.assets.images.interest(1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    return Expanded(
      child: Image.asset(path, cacheWidth: imageCacheWidth, fit: BoxFit.cover),
    );
  }

  void _onCardTap() {
    getIt<ActiveBackgroundCubit>().applyDefaultBackground();
  }
}
