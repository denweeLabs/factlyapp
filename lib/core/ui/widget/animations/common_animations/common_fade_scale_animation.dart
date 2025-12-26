part of 'common_animations.dart';

@immutable
class CommonFadeScale extends StatefulWidget {
  final bool animate;
  final Widget child;
  final BiPos<double> fades;
  final BiPos<double> scales;
  final Duration delay;
  final Duration duration;
  final Duration reverseDuration;
  final Curve fadeCurve;
  final Curve scaleCurve;
  final Curve reverseScaleCurve;

  const CommonFadeScale({
    super.key,
    this.animate = true,
    required this.child,
    required this.fades,
    required this.scales,
    this.delay = Duration.zero,
    this.duration = CommonAnimationValues.commonFadeScaleDuration,
    this.reverseDuration = CommonAnimationValues.commonFadeScaleDuration,
    this.fadeCurve = CommonAnimationValues.commonFadeCurve,
    this.scaleCurve = CommonAnimationValues.commonScaleCurve,
    this.reverseScaleCurve = CommonAnimationValues.commonScaleCurve,
  });

  @override
  State<CommonFadeScale> createState() => _CommonFadeScaleState();
}

class _CommonFadeScaleState extends State<CommonFadeScale>
    with TickerProviderStateMixin, CommonAnimationsMixin {
  late Animation<double> scale;
  late Animation<double> fade;

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
    scale = Tween<double>(
      begin: widget.scales.onTrue,
      end: widget.scales.onFalse,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.scaleCurve,
        reverseCurve: widget.reverseScaleCurve,
      ),
    );
    fade = Tween<double>(
      begin: widget.fades.onTrue,
      end: widget.fades.onFalse,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.fadeCurve,
        reverseCurve: widget.fadeCurve,
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
          (_, child) => Transform.scale(
            scale: scale.value,
            child: Opacity(opacity: fade.value, child: widget.child),
          ),
      child: widget.child,
    );
  }
}
