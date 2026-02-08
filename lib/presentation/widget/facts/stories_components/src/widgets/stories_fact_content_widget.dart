import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/theme/text_styles.dart';
import 'package:denwee/presentation/widget/shared/misc/app_markdown_text_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/backdrop_surface_container_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoriesFactShortContent extends StatelessWidget {
  const StoriesFactShortContent({
    super.key,
    required this.emoji,
    required this.content,
    required this.padding,
    this.textStyle,
  });

  final String emoji;
  final String content;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveFontFamily = getIt<UserPreferencesCubit>().state
        .whenLanguage(
          en: () => textStyle?.fontFamily ?? AppConstants.style.textStyle.primaryFontFamily,
          ru: () => AppConstants.style.textStyle.secondaryFontFamiliy,
        );

    final effectiveTextStyle = factShortContent.copyWith(
      color: textStyle?.color ?? context.lightTextColor,
      fontSize: (textStyle?.fontSize ?? 20).sp,
      fontFamily: effectiveFontFamily,
    );

    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              emoji,
              style: TextStyle(fontSize: 28.sp, color: Colors.white),
            ),
          ),
          18.verticalSpace,
          Text(
            content.replaceAll('**', ''),
            style: effectiveTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  static Widget buildFactHeader({
    required BuildContext context,
    required String emoji,
    required String title,
    required String? date,
    Color? elipseColor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BackdropSurfaceContainer.ellipse(
          size: Size.square(46.w),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: elipseColor ?? Colors.white,
          child: Center(
            child: Text(
              emoji,
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: factHeaderTitle.copyWith(color: context.lightTextColor),
                overflow: TextOverflow.ellipsis,
                maxLines: date != null ? 1 : 2,
              ),
              if (date != null) ...[
                1.verticalSpace,
                Text(
                  date,
                  style: bodyM.copyWith(color: context.lightTextColorSecondary),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class StoriesFactLongContent extends StatelessWidget {
  const StoriesFactLongContent({
    super.key,
    required this.fullContent,
    required this.streamedContent,
    required this.padding,
    required this.brightness,
  });

  final String? fullContent;
  final Stream<String>? streamedContent;
  final EdgeInsets padding;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    if (fullContent == null && streamedContent == null) {
      return const SizedBox.shrink();
    }

    final color = brightness == Brightness.dark
        ? context.lightTextColor
        : context.darkTextColor;

    return Padding(
      padding: padding,
      child: fullContent != null
          ? AppMarkdownText(
              data: fullContent!,
              pTextStyle: factDetailedContent.copyWith(color: color),
              hTextStyle: h1.copyWith(color: color),
              bqTextStyle: factDetailedContent.copyWith(color: color),
            )
          : StreamedMarkdownText(
              stream: streamedContent,
              pTextStyle: factDetailedContent.copyWith(color: color),
              hTextStyle: h1.copyWith(color: color),
              bqTextStyle: factDetailedContent.copyWith(color: color),
            ),
    );
  }
}
