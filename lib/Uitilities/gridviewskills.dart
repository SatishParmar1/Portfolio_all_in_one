import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/textdata/alllink.dart';

class SkillCard extends StatelessWidget {
  final String image;
  final String title;
  final Color color;

  const SkillCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageSize = constraints.maxHeight * 0.5; // 50% of container height
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $image');
                  return Icon(Icons.error, size: imageSize);
                },
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
