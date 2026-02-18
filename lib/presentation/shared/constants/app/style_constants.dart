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

  final primaryFontFamily = 'Quicksand';
  final secondaryFontFamiliy = 'Manrope';
}

class _ColorsConstants {
  const _ColorsConstants();

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
    color: Colors.black26,
    offset: Offset(0.0, 6.0),
    spreadRadius: -10.0,
    blurRadius: 16,
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
    final bottomPadding = context.bottomPadding;
    return bottomPadding > 0 ? bottomPadding + 18.h : 24.h;
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
