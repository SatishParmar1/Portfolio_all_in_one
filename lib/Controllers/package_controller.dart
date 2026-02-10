import 'package:flutter/material.dart';

class PackageController with ChangeNotifier {
  final List<Map<String, dynamic>> packages = [
    {
      'name': 'page_navigation_transition',
      'version': '1.1.0',
      'description':
          'A comprehensive Flutter package providing 110+ page navigation transitions with Hero support, Custom Curves, Presets, and Performance Optimizations.',
      'features': [
        '110+ Pre-built Transitions in 14 categories',
        'Named Route Support with onGenerateRoute',
        'Hero-aware transitions',
        '8 Transition Presets (Elegant, Playful, Professional, Gaming...)',
        '6 New 3D Effects — Origami, Prism, Sphere, ZStack, Hologram',
        'Custom Curve Builder with spring, bounce & elastic curves',
        'Zero dependencies — only Flutter SDK required',
        'Cross-platform — iOS, Android, Web, Desktop',
      ],
      'link': 'https://pub.dev/packages/page_navigation_transition',
      'github':
          'https://github.com/SatishParmar1/page_navigation_transition',
      'icon': Icons.swap_horiz_rounded,
      'platforms': ['Android', 'iOS', 'Web', 'Windows', 'macOS', 'Linux'],
    },
    {
      'name': 'photo_opener_view',
      'version': '1.1.0',
      'description':
          'A powerful and customizable Flutter package for viewing images and videos with beautiful UI styles and animations.',
      'features': [
        'Pinch-to-zoom & Double-tap zoom',
        'Swipe-to-dismiss gestures (Instagram/Facebook style)',
        'Hero animation support for seamless transitions',
        'Swipeable gallery with thumbnail strip navigation',
        'Full-Featured Video Player with custom UI controls',
        'VideoThumbnailContainer — inline player with 6 play button styles',
        '5 Beautiful Built-in Styles — Modern, Minimal, Instagram, Cinematic, Glassmorphism',
        'Works on Android, iOS, Web, Windows, macOS, Linux',
      ],
      'link': 'https://pub.dev/packages/photo_opener_view',
      'github':
          'https://github.com/SatishParmar1/Photo_Opening_Package',
      'icon': Icons.photo_library_rounded,
      'platforms': ['Android', 'iOS', 'Web', 'Windows', 'macOS', 'Linux'],
    },
    {
      'name': 'smart_review_prompter',
      'version': '0.0.2',
      'description':
          'A smart way to show in-app review prompts based on user engagement, such as app open count and days since install.',
      'features': [
        'Smart Timing — prompts based on app opens & install date',
        'One-Time Prompt — auto-tracks if review was already requested',
        'Automatic Tracking — counts opens & stores install date',
        'Simple API — just 3 methods to integrate',
        'Native Experience — iOS SKStoreReviewController & Google Play API',
        'Wraps in_app_review & shared_preferences in one API',
        'Customizable conditions for your app\'s needs',
        'Gracefully handled on unsupported platforms',
      ],
      'link': 'https://pub.dev/packages/smart_review_prompter',
      'github':
          'https://github.com/SatishParmar1/smart_review_prompter',
      'icon': Icons.rate_review_rounded,
      'platforms': ['Android', 'iOS'],
    },
  ];
}
