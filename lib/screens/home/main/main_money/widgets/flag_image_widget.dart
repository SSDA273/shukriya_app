import 'package:flutter/material.dart';
import '../../../../../constant/color_manger.dart';
import '../../../../../constant/api_const/app_api.dart';

/// A reusable widget for displaying currency flag images with error handling
/// and loading states. This widget safely handles network image loading failures.
/// Automatically validates URLs and prepends base URL if needed.
class FlagImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const FlagImageWidget({
    required this.imageUrl,
    this.width = 32,
    this.height = 24,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Validate and prepare the image URL
    final validatedUrl = _validateAndPrependUrl(imageUrl);
    
    return Image.network(
      validatedUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      // Handle loading state
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          width: width,
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.grey5,
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        );
      },
      // Handle error state
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: ColorManager.grey5,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: ColorManager.grey4,
              width: 0.5,
            ),
          ),
          child: const Icon(
            Icons.language,
            size: 16,
            color: Colors.grey,
          ),
        );
      },
    );
  }

  /// Validates the image URL and prepends base URL if needed
  /// Returns a complete URL that Image.network() can load
  /// 
  /// Rules:
  /// - If URL is null or empty: returns placeholder
  /// - If URL starts with http/https: returns as-is
  /// - Otherwise: prepends AppAPI.baseUrl
  static String _validateAndPrependUrl(String? imageUrl) {
    // Handle null or empty URL
    if (imageUrl == null || imageUrl.isEmpty) {
      return 'https://via.placeholder.com/32x24?text=Flag';
    }

    // If already has protocol, return as-is
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    // Prepend base URL for relative paths
    final completeUrl = '${AppAPI.baseUrl}$imageUrl';
    return completeUrl;
  }
}