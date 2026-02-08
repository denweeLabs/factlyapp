import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/presentation/bloc/facts/facts_archive_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/widget/shared/buttons/icon_button_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppArchiveButton extends StatelessWidget {
  const AppArchiveButton({
    super.key,
    required this.factId,
    this.iconPadding,
    this.iconColor,
    this.size = 24.0,
  });

  final UniqueId factId;
  final EdgeInsets? iconPadding;
  final Color? iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BlocBuilder<FactsArchiveCubit, FactsArchiveState>(
        builder: (context, state) {
          final isArchived = state.isArchived(factId);
          return AppIconButton(
            onTap: () => _onTap(isArchived),
            color: iconColor ?? context.lightIconColor,
            padding: iconPadding ?? EdgeInsets.symmetric(horizontal: 26.w),
            iconPath: isArchived
                ? AppConstants.assets.icons.archiveTickBold
                : AppConstants.assets.icons.archiveTickLinear,
            size: size,
          );
        },
      ),
    );
  }

  void _onTap(bool isArchived) async {
    isArchived
        ? getIt<FactsArchiveCubit>().remove(factId)
        : getIt<FactsArchiveCubit>().add(factId);
  }
}
