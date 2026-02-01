import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({super.key, required this.url, this.fit});

  final String url;
  final BoxFit? fit;

  static const kTransparentPlaceholder = 'assets/images/transparent_1024.png';
  static const fadeDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage(kTransparentPlaceholder),
      image: NetworkImage(url),
      fit: fit ?? BoxFit.cover,
      fadeInDuration: fadeDuration,
      fadeOutDuration: fadeDuration,
      placeholderFilterQuality: FilterQuality.low,
    );
  }
}
