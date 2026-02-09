part of 'common_animations.dart';

@immutable
class CommonFadeSlide extends StatefulWidget {
  final bool animate;
  final Widget child;
  final BiPos<double> fades;
  final BiPos<Offset> offsets;
  final Duration duration;
  final Duration reverseDuration;
  final Duration delay;
  final Curve fadeCurve;
  final Curve offsetCurve;
  final Curve reverseOffsetCurve;
  final VoidCallback? onCompleted;

  const CommonFadeSlide({
    super.key,
    this.animate = true,
    required this.child,
    required this.fades,
    required this.offsets,
    this.delay = Duration.zero,
    this.duration = CommonAnimationValues.commonFadeSlideDuration,
    this.reverseDuration = CommonAnimationValues.commonFadeSlideDuration,
    this.fadeCurve = CommonAnimationValues.commonFadeCurve,
    this.offsetCurve = CommonAnimationValues.commonSlideCurve,
    this.reverseOffsetCurve = CommonAnimationValues.commonSlideCurve,
    this.onCompleted,
  });

  @override
  State<CommonFadeSlide> createState() => _CommonFadeSlideState();
}

class _CommonFadeSlideState extends State<CommonFadeSlide>
    with TickerProviderStateMixin, CommonAnimationsMixin {
  late Animation<Offset> slide;
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
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted?.call();
      }
    });
    slide = Tween<Offset>(
      begin: widget.offsets.onTrue,
      end: widget.offsets.onFalse,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.offsetCurve,
        reverseCurve: widget.reverseOffsetCurve,
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
  void didUpdateWidget(covariant CommonFadeSlide oldWidget) {
    if (oldWidget.duration != widget.duration) {
      initAnimations();
    }
    super.didUpdateWidget(oldWidget);
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
          (_, child) => Transform.translate(
            offset: slide.value,
            child: Opacity(opacity: fade.value, child: child),
          ),
      child: widget.child,
    );
  }
}
