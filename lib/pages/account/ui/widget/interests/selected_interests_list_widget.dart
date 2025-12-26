import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/pages/account/ui/widget/interests/selected_interest_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedInterestsList extends StatelessWidget {
  const SelectedInterestsList({
    super.key,
    required this.interests,
    required this.onEdit,
  });

  final List<UserInterest> interests;
  final VoidCallback onEdit;

  static final height = 146.h;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(height),
      child: ClipRSuperellipse(
        borderRadius: BorderRadius.all(AppConstants.style.radius.cardSmall),
        child: ListView.separated(
          itemCount: interests.length + 1,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => 6.horizontalSpace,
          itemBuilder: (context, index) {
            if (index == interests.length) {
              return SelectedInterestCard.more(
                onTap: onEdit,
                onLongTap: onEdit,
              );
            }
            return SelectedInterestCard.item(
              interest: interests[index],
              onTap: onEdit,
              onLongTap: onEdit,
            );
          },
        ),
      ),
    );
  }
}
