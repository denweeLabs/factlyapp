part of 'common_animations.dart';

@immutable
class CommonFade extends StatefulWidget {
  final Widget child;
  final BiPos<double> fades;
  final Duration delay;
  final Duration duration;
  final Duration reverseDuration;
  final bool animate;
  final Curve curve;

  const CommonFade({
    super.key,
    this.animate = true,
    required this.child,
    required this.fades,
    this.delay = Duration.zero,
    this.duration = CommonAnimationValues.commonFadeDuration,
    this.reverseDuration = CommonAnimationValues.commonFadeDuration,
    this.curve = CommonAnimationValues.commonFadeCurve,
  });

  @override
  State<CommonFade> createState() => _CommonFadeBlurState();
}

class _CommonFadeBlurState extends State<CommonFade>
    with TickerProviderStateMixin, CommonAnimationsMixin {
  late Animation<double> opacity;

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
        curve: widget.curve,
        reverseCurve: widget.curve,
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
      builder: (_, child) => Opacity(opacity: opacity.value, child: child),
      child: widget.child,
    );
  }
}
