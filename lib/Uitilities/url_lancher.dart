import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Urllancher {

  Future<void> launchInBrowser(Uri url) async {
    try {
      final mode = kIsWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication;

      if (!await launchUrl(url, mode: mode)) {
        throw Exception('Could not launch $url'); //
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  Future<void> launchWebUrl(String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);
      await launchInBrowser(url);
    } catch (e) {
      debugPrint('Error launching web URL: $e');
    }
  }

  Future<void> launchEmail(String emailAddress,
      {String? subject, String? body}) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: emailAddress,
        query: encodeQueryParameters(<String, String>{
          'subject': subject ?? '',
          'body': body ?? '',
        }),
      );
      await launchInBrowser(emailLaunchUri);
    } catch (e) {
      debugPrint('Error launching email: $e');
    }
  }


  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}') //
        .join('&'); //
  }


  Future<void> launchPhoneNumber(String phoneNumber) async {
    try {
      final Uri phoneLaunchUri = Uri(
        scheme: 'tel', //
        path: phoneNumber, //
      );
      await launchInBrowser(phoneLaunchUri);
    } catch (e) {
      debugPrint('Error launching phone number: $e');
      // Handle or rethrow the exception as needed
    }
  }
}