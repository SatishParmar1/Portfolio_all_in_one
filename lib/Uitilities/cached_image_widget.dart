import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? cacheHeight;
  final int? cacheWidth;

  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.cacheHeight,
    this.cacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Container(
        width: width,
        height: height,
        color: Colors.grey[900],
        child: const Icon(Icons.image_not_supported, color: Colors.white54),
      );
    }
    
    // Check if it's not a network image (basic check)
    if (!imageUrl.startsWith('http')) {
       return Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
       );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      // Optional: Downsample for memory optimization if cache dimensions are provided
      memCacheHeight: cacheHeight,
      memCacheWidth: cacheWidth,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Colors.grey[900],
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey[900],
        child: const Icon(Icons.broken_image, color: Colors.white54),
      ),
    );
  }
}
