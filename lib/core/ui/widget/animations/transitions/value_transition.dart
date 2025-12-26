import 'package:flutter/widgets.dart';

class ValueTransition extends AnimatedWidget {
  const ValueTransition({
    super.key,
    required Animation<double> value,
    required this.builder,
  }) : super(listenable: value);

  Animation<double> get val => listenable as Animation<double>;

  final Widget Function(double) builder;

  @override
  Widget build(BuildContext context) {
    return builder(val.value);
  }
}
