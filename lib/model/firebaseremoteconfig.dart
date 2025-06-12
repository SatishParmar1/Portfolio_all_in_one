import 'package:firebase_remote_config/firebase_remote_config.dart';

class Firebaseremoteconfig {

Map<int, String> skilldata = {};
   Future<String?> _fetchLatestVersion() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: const Duration(seconds: 1),
      ));

      await remoteConfig.fetchAndActivate();
      final showtitle = remoteConfig.getBool('showtitle');
      final titlestring = remoteConfig.getString('Title');


      if (titlestring.isEmpty || !showtitle) {
        print("Version not found in remote config");
        return "";
      }

      return titlestring;
    } catch (e, stack) {
      print("Remote config fetch error: $e");
      print("Stack trace: $stack");
      return "";
    }
  }


}