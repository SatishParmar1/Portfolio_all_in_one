import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Urllancher {
  Future<void> launchInBrowser(Uri url) async {
    try {
      final mode = kIsWeb 
          ? LaunchMode.platformDefault 
          : LaunchMode.externalApplication;
          
      if (!await launchUrl(url, mode: mode)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      // You might want to show a snackbar or dialog here to inform the user
    }
  }
}