import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unitey_app/constant/api_const/app_api.dart';

class BillerImage extends StatelessWidget {
  final String? imageKey;
  final String? fallbackAsset;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? backgroundColor;

  const BillerImage({
    Key? key,
    required this.imageKey,
    this.fallbackAsset,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.backgroundColor,
  }) : super(key: key);

  Widget _buildFallback() {
    Widget fallbackWidget;
    if (fallbackAsset == null || fallbackAsset!.isEmpty) {
      fallbackWidget = const Icon(Icons.broken_image, color: Colors.grey);
    } else if (fallbackAsset!.toLowerCase().endsWith(".svg")) {
      fallbackWidget = SvgPicture.asset(
        fallbackAsset!,
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      fallbackWidget = Image.asset(
        fallbackAsset!,
        height: height,
        width: width,
        fit: fit,
      );
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: Center(child: fallbackWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyInvalid = imageKey == null || 
                       imageKey!.isEmpty || 
                       imageKey!.toLowerCase() == "null" || 
                       imageKey!.toLowerCase() == "undefined";

    if (isKeyInvalid) {
      return _buildFallback();
    }

    final imageUrl = AppAPI.getFileUrl(imageKey);

    if (imageUrl.toLowerCase().endsWith(".svg")) {
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        placeholderBuilder: (context) => const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return _buildFallback();
      },
    );
  }
}
