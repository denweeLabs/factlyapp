import 'package:flutter/material.dart';

class TopRoundedClipper extends CustomClipper<Path> {
  final double heightFactor;

  const TopRoundedClipper({required this.heightFactor});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;

    path.lineTo(0, heightFactor);
    path.quadraticBezierTo(width / 2, -heightFactor, width, heightFactor);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
