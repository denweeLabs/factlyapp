part of 'package:denwee/pages/background_edit/background_edit_page.dart';

class _BackgroundEditActionSlider extends StatefulWidget {
  const _BackgroundEditActionSlider({
    required this.value,
    required this.onChanged,
    required this.width,
    required this.isSnapping,
    required this.triangleColor,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double width;
  final bool isSnapping;
  final Color triangleColor;

  @override
  State<_BackgroundEditActionSlider> createState() =>
      _BackgroundEditActionSliderState();
}

class _BackgroundEditActionSliderState
    extends State<_BackgroundEditActionSlider>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;

  double animatedValue = 0.0;

  @override
  void initState() {
    super.initState();

    animatedValue = widget.value;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );

    animation = AlwaysStoppedAnimation(widget.value);
  }

  @override
  void didUpdateWidget(covariant _BackgroundEditActionSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      animateTo(widget.value);
    }
  }

  void animateTo(double target) {
    if (widget.isSnapping) {
      animatedValue = target;
      HapticUtil.click();
      return;
    }

    animation = Tween<double>(
      begin: animatedValue,
      end: target,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller
      ..reset()
      ..forward();

    controller.addListener(() {
      setState(() {
        animatedValue = animation.value;
      });
    });
  }

  void _updateValue(Offset localPosition, double height) {
    final dy = localPosition.dy.clamp(0.0, height);
    final newValue = 1.0 - (dy / height);
    final clamped = newValue.clamp(0.0, 1.0);
    widget.onChanged(clamped);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: (_) => HapticUtil.light(),
          onPanDown: (d) => _updateValue(d.localPosition, height),
          onPanUpdate: (d) => _updateValue(d.localPosition, height),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: CustomPaint(
              size: Size(widget.width, height),
              painter: _TriangleFadeSliderPainter(
                value: animatedValue,
                triangleColor: widget.triangleColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TriangleFadeSliderPainter extends CustomPainter {
  _TriangleFadeSliderPainter({
    required this.value,
    required this.triangleColor,
  });

  final double value;
  final Color triangleColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    final trianglePath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    paint
      ..shader = null
      ..color = triangleColor;

    canvas.drawPath(trianglePath, paint);

    final thumbCenter = Offset(size.width / 2, (1.0 - value) * size.height);

    paint
      ..color = Colors.black87
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    canvas.drawCircle(thumbCenter.translate(0, 5), 6, paint);

    paint
      ..color = Colors.white
      ..maskFilter = null;

    canvas.drawCircle(thumbCenter, 12, paint);
  }

  @override
  bool shouldRepaint(covariant _TriangleFadeSliderPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
