import 'dart:math';

String capitalizeFirstCharacter(String text) {
  if (text.isEmpty) {
    return text;
  }
  final buffer = StringBuffer();
  final raw = text;
  buffer.write(raw[0].toUpperCase());
  buffer.write(raw.substring(1));
  return buffer.toString();
}

bool pseudoProbabilityOf(int percent) {
  final fraction = (percent / 100).clamp(0.0, 1.0);
  return Random().nextDouble() <= fraction;
}
