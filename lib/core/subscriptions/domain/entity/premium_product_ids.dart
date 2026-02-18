import 'package:flutter/foundation.dart';

@immutable
class PremiumProductIds {
  final String weekly;
  final String monthly;
  final String yearly;
  
  const PremiumProductIds({
    required this.weekly,
    required this.monthly,
    required this.yearly,
  });
}
