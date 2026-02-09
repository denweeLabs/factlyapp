part of 'common_animations.dart';

@immutable
class CommonFadeBlur extends StatefulWidget {
  final Widget child;
  final BiPos<double> fades;
  final BiPos<Offset> blurs;
  final Duration delay;
  final Duration duration;
  final Duration reverseDuration;
  final bool animate;
  final Curve fadeCurve;
  final Curve blurCurve;

  const CommonFadeBlur({
    super.key,
    this.animate = true,
    required this.child,
    required this.fades,
    required this.blurs,
    this.delay = Duration.zero,
    this.duration = CommonAnimationValues.commonFadeDuration,
    this.reverseDuration = CommonAnimationValues.commonFadeDuration,
    this.fadeCurve = CommonAnimationValues.commonFadeCurve,
    this.blurCurve = CommonAnimationValues.commonBlurCurve,
  });

  @override
  State<CommonFadeBlur> createState() => __CommonFadeBlurState();
}

class __CommonFadeBlurState extends State<CommonFadeBlur>
    with TickerProviderStateMixin, CommonAnimationsMixin {
  late Animation<double> opacity;
  late Animation<Offset> blur;

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    opacity = Tween<double>(
      begin: widget.fades.onTrue,
      end: widget.fades.onFalse,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.fadeCurve,
        reverseCurve: widget.fadeCurve,
      ),
    );
    blur = Tween<Offset>(
      begin: widget.blurs.onTrue,
      end: widget.blurs.onFalse,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.blurCurve,
        reverseCurve: widget.blurCurve,
      ),
    );
  }

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildAnimation(delay: widget.delay, animate: widget.animate);

    return AnimatedBuilder(
      animation: controller,
      builder:
          (_, child) => BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur.value.dx,
              sigmaY: blur.value.dy,
            ),
            child: Opacity(opacity: opacity.value, child: child),
          ),
      child: widget.child,
    );
  }
}
