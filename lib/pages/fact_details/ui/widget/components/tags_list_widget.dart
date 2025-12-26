import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/theme/text_styles.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:denwee/core/ui/widget/buttons/icon_widget.dart';
import 'package:denwee/core/ui/widget/misc/backdrop_surface_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';
import 'package:utils/utils.dart';

class FactTagsList extends StatelessWidget {
  const FactTagsList({
    super.key,
    required this.fact,
    required this.padding,
  });

  final DailyFact fact;
  final EdgeInsets padding;

  static final listHeight = 40.h;

  @override
  Widget build(BuildContext context) {
    final tilesSpacing = 6.w;

    final physics = SnapScrollPhysics(
      snaps: [Snap(0.0, trailingDistance: 80.w)],
    );

    return SizedBox(
      height: listHeight,
      width: double.infinity,
      child: ListView(
        physics: physics,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: padding.left, right: padding.right),
        children: [
          if (fact.source.isSome()) ...[
            _buildListTile(
              context: context,
              text: _extractSourceDomain().capitalizeFirstLetter,
              iconPath: AppConstants.assets.icons.globeLinear,
              onTap: () => LauncherUtil.launchUrl(
                fact.source.toNullable()!.value,
                linkType: LinkLaunchType.domain,
              ),
            ),
          ],
          if (fact.date.isSome() && fact.showTimeAgoDate()) ...[
            SizedBox(width: tilesSpacing),
            _buildListTile(
              context: context,
              text: fact.fullDateText() ?? '',
              iconPath: AppConstants.assets.icons.clockLinear,
              onTap: null,
            ),
          ],
          if (fact.region.fold(() => false, (value) => value.isNotEmpty)) ...[
            SizedBox(width: tilesSpacing),
            _buildListTile(
              context: context,
              text: fact.region.toNullable()!,
              iconPath: AppConstants.assets.icons.locationLinear,
              onTap: () => LauncherUtil.launchPlaceOnMap(
                fact.region.toNullable()!.capitalizeFirstLetter,
              ),
            ),
          ],
          if (fact.relatedTopics.isSome()) ...[
            ...fact.relatedTopics.toNullable()!.map((topic) => Padding(
                  padding: EdgeInsets.only(left: tilesSpacing),
                  child: _buildListTile(
                    context: context,
                    text: topic.capitalizeFirstLetter,
                    iconPath: AppConstants.assets.icons.hashtagLinear,
                    onTap: null,
                  ),
                )),
          ],
        ],
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String text,
    required String iconPath,
    required VoidCallback? onTap,
  }) {
    return BackdropSurfaceContainer.ellipse(
      onTap: onTap,
      color: Colors.black38,
      borderColor: Colors.white10,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            CommonAppIcon(
              path: iconPath,
              color: context.lightIconColor,
              size: 14,
            ),
            6.horizontalSpace,
            Text(
              text,
              style: bodyM.copyWith(
                color: context.lightTextColor.withValues(alpha: 0.9),
                fontFamily: AppConstants.style.textStyle.secondaryFontFamiliy,
              ),
              overflow: TextOverflow.visible,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  String _extractSourceDomain() {
    final url = fact.source.toNullable()!.value;
    final uri = Uri.parse(url);
    return uri.host.replaceAll('www.', '');
  }
}
