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
    final safeUrl = url.trim();

    debugPrint("IMAGE URL => $safeUrl");

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: safeUrl,

        // important: avoid layout crash
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,

        // loading UI
        placeholder: (context, url) => const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),

        // better error handling
        errorWidget: (context, url, error) {
          debugPrint("IMAGE LOAD ERROR => $error");
          return const NoImage();
        },

        // optional: prevent cache weird issues
        useOldImageOnUrlChange: true,
      ),
    );
  }
}