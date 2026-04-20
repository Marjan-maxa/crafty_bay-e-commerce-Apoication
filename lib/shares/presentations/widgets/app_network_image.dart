import 'package:cached_network_image/cached_network_image.dart';
import 'package:crafty_bay/shares/presentations/widgets/no_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  });
  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: fit,
        errorWidget: (context, url, error) => NoImage(),
        progressIndicatorBuilder: (context, url, downloadProgress) => NoImage(),
      ),
    );
  }
}
