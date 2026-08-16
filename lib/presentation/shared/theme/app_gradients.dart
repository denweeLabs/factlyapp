import 'package:flutter/material.dart';

/// Centralized gradient presets for tile icon boxes.
/// Each preset runs top-left to bottom-right, light shade into dark shade.
enum AppTileGradient {
  // ---------------------------
  // WARM
  // ---------------------------
  red(Color(0xFFFB7A80), Color(0xFFE11D48)),
  crimson(Color(0xFFF87171), Color(0xFFB91C1C)),
  rose(Color(0xFFFDA4AF), Color(0xFFF43F5E)),
  orange(Color(0xFFFBA45A), Color(0xFFF97316)),
  amber(Color(0xFFFCC64D), Color(0xFFF59E0B)),
  peach(Color(0xFFFDBA8C), Color(0xFFEA7C4D)),
  brown(Color(0xFFC4A484), Color(0xFF8B5E34)),

  // ---------------------------
  // COOL
  // ---------------------------
  blue(Color(0xFF5B9DF9), Color(0xFF2563EB)),
  sky(Color(0xFF7DD3FC), Color(0xFF0EA5E9)),
  cyan(Color(0xFF54C2F5), Color(0xFF0284C7)),
  teal(Color(0xFF45D6C2), Color(0xFF0D9488)),
  mint(Color(0xFF6EE7C7), Color(0xFF10B981)),
  indigo(Color(0xFF7C83F3), Color(0xFF4338CA)),

  // ---------------------------
  // GREEN
  // ---------------------------
  green(Color(0xFF5FD98B), Color(0xFF16A34A)),
  emerald(Color(0xFF34D399), Color(0xFF059669)),
  lime(Color(0xFFA3E635), Color(0xFF65A30D)),

  // ---------------------------
  // PURPLE / PINK
  // ---------------------------
  purple(Color(0xFFB57BF7), Color(0xFF7C3AED)),
  violet(Color(0xFFA78BFA), Color(0xFF6D28D9)),
  fuchsia(Color(0xFFE879F9), Color(0xFFC026D3)),
  pink(Color(0xFFF77BB4), Color(0xFFDB2777)),
  plum(Color(0xFFC084FC), Color(0xFF86198F)),

  // ---------------------------
  // NEUTRAL
  // ---------------------------
  graphite(Color(0xFF9CA3AF), Color(0xFF4B5563)),
  slate(Color(0xFF94A3B8), Color(0xFF475569)),

  // ---------------------------
  // BLENDED
  // ---------------------------
  sunset(Color(0xFFFBBF24), Color(0xFFF43F5E)),
  ocean(Color(0xFF38BDF8), Color(0xFF4338CA)),
  aurora(Color(0xFF2DD4BF), Color(0xFF7C3AED)),
  dusk(Color(0xFFA78BFA), Color(0xFFF472B6)),
  midnight(Color(0xFF64748B), Color(0xFF1E293B));

  const AppTileGradient(this.begin, this.end);

  final Color begin;
  final Color end;

  LinearGradient get gradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [begin, end],
      );
}
