import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OptimizedImage extends StatelessWidget {
  final String assetPath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final AlignmentGeometry alignment;

  const OptimizedImage({
    Key? key,
    required this.assetPath,
    this.height,
    this.width,
    this.fit,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      alignment: alignment,
      // Performance optimizations
      cacheHeight: height != null ? 
        (height! * MediaQuery.of(context).devicePixelRatio).round() : null,
      cacheWidth: width != null ? 
        (width! * MediaQuery.of(context).devicePixelRatio).round() : null,
      // For web performance
      isAntiAlias: !kIsWeb, // Disable anti-aliasing on web for better performance
      filterQuality: kIsWeb ? FilterQuality.low : FilterQuality.medium,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }
        // Show a simple loading indicator while image loads
        return Container(
          height: height,
          width: width,
          color: Colors.grey[900],
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: height,
          width: width,
          color: Colors.grey[800],
          child: const Icon(
            Icons.error,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
