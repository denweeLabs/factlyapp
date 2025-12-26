part of 'app_constants.dart';

class _StyleConstants {
  const _StyleConstants();

  final textStyle = const _TextStylesConstants();
  final colors = const _ColorsConstants();
  final padding = const _PaddingConstants();
  final radius = const _RadiusConstants();
}

class _TextStylesConstants {
  const _TextStylesConstants();

  final primaryFontFamily = 'Manrope';
  final secondaryFontFamiliy = 'Quicksand';
}

class _ColorsConstants {
  const _ColorsConstants();

  LinearGradient commonBackgroundGradient(
    BuildContext context, {
    Color? color1,
    Color? color2,
  }) =>
      LinearGradient(
        colors: [
          color1 ?? context.theme.colorScheme.background,
          color2 ?? context.theme.colorScheme.onBackground,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  LinearGradient commonColoredGradient(
    BuildContext context, {
    Color? color1,
    Color? color2,
  }) =>
      LinearGradient(
        colors: [
          color1 ?? context.theme.colorScheme.primary,
          color2 ?? context.theme.colorScheme.secondary,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  LinearGradient commonColoredGradientReversed(BuildContext context) =>
      LinearGradient(
        colors: [
          context.theme.colorScheme.secondary,
          context.theme.colorScheme.primary,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  final commonShadow = const BoxShadow(
    color: Colors.black38,
    offset: Offset(0.0, 6.0),
    spreadRadius: -10.0,
    blurRadius: 16,
  );

  BoxShadow commonColoredShadow(BuildContext context) => BoxShadow(
        color: context.theme.colorScheme.primary,
        offset: const Offset(0.0, 8.0),
        spreadRadius: -14.0,
        blurRadius: 24.0,
      );

  final dialogShadow = const BoxShadow(
    color: Colors.black54,
    offset: Offset(0.0, 8.0),
    spreadRadius: -10.0,
    blurRadius: 18.0,
  );
}

class _PaddingConstants {
  const _PaddingConstants();

  double onboardingBottomCtaPadding(BuildContext context) {
    return context.bottomPadding * 1.0 + 36.h;
  }
  double bottomCtaPadding(BuildContext context) {
    return context.bottomPadding * 1.0 + 42.h;
  }
}


class _RadiusConstants {
  const _RadiusConstants();

  Radius get card => Radius.circular(34.r);
  Radius get cardSmall => Radius.circular(26.r);
  Radius get cardMedium => Radius.circular(30.r);
  Radius get fab => Radius.circular(28.r);
  Radius get actionButton => Radius.circular(28.r);
  Radius get dialog => Radius.circular(34.r);
}
