part of 'package:denwee/pages/background_edit/background_edit_page.dart';

class _DefaultColors {
  static const whites = [
    Color(0xFFF2F2F2),
    Color(0xFFE6E6E6),
    Color(0xFFDADADA),
  ];

  static const blacks = [
    Color(0xFF1A1A1A),
    Color(0xFF333333),
    Color(0xFF4D4D4D),
  ];

  static const accents = [
    Color(0xFFFF6F61),
    Color(0xFFFF8C42),
    Color(0xFFFFC857),
    Color(0xFF6BCF9D),
    Color(0xFF4DD0E1),
    Color(0xFF5C7CFA),
    Color(0xFF845EF7),
    Color(0xFFD6336C),
    Color(0xFFB197FC),
    Color(0xFF63E6BE),
    Color(0xFF74C0FC),
    Color(0xFFA9E34B),
    Color(0xFFFF922B),
    Color(0xFF20C997),
    Color(0xFF339AF0),
    Color(0xFF9775FA),
    Color(0xFFE64980),
    Color(0xFF15AABF),
    Color(0xFF82C91E),
    Color(0xFFFAB005),
  ];
}

class _ColorBubblesList extends StatefulWidget {
  const _ColorBubblesList({
    required this.selectedColor,
    required this.onColorSelected,
    required this.defaultColor,
  });

  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;
  final Color defaultColor;

  static final height = CoreBubble.size + (18.h * 2);

  @override
  State<_ColorBubblesList> createState() =>
      _ColorBubblesListState();
}

class _ColorBubblesListState
    extends State<_ColorBubblesList> {
  late final controller = ScrollController(
    initialScrollOffset: 12.w + CoreBubble.size * 1.5,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      ..._DefaultColors.whites,
      ..._DefaultColors.blacks,
      ..._DefaultColors.accents,
    ];

    if (!colors.contains(widget.defaultColor)) {
      colors.insert(3, widget.defaultColor);
    }

    return ListView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
      children: [
        HueWheelBubble(
          isSelected: !colors.contains(widget.selectedColor),
          onTap: _onCustomColor,
        ),
        2.horizontalSpace,
        ...colors.map((color) {
          final isSelected = widget.selectedColor == color;

          return ColorBubble(
            color: color,
            isSelected: isSelected,
            onTap: () => widget.onColorSelected(color),
          );
        }),
      ],
    );
  }

  void _onCustomColor() async {
    AppDialogs.showHsvColorPickerDialog(
      context,
      selectedColor: widget.selectedColor,
      onChanged: widget.onColorSelected,
    );
  }
}

class HueWheelBubble extends StatelessWidget {
  const HueWheelBubble({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CoreBubble(
      onTap: onTap,
      isSelected: isSelected,
      child: ClipOval(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [
                Color(0xFFFF0000),
                Color(0xFFFF7F00),
                Color(0xFFFFFF00),
                Color(0xFF00FF00),
                Color(0xFF00FFFF),
                Color(0xFF0000FF),
                Color(0xFF8B00FF),
                Color(0xFFFF0000),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorBubble extends StatelessWidget {
  const ColorBubble({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
    this.child,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? child;

  static final size = 36.w;

  @override
  Widget build(BuildContext context) {
    return CoreBubble(
      onTap: onTap,
      isSelected: isSelected,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24),
          color: color,
        ),
      ),
    );
  }
}

class CoreBubble extends StatelessWidget {
  const CoreBubble({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.child,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget? child;

  static final size = 34.w;

  @override
  Widget build(BuildContext context) {
    return BounceTapAnimation(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: SizedBox.fromSize(
          size: Size.square(size),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(padding: const EdgeInsets.all(4), child: child),
              if (isSelected)
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
