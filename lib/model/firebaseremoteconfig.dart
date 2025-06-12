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

  void checkflutterdata()async{
     Map<int, String> fluttergraphdata = await fetchskilldata();
    if(fluttergraphdata[0] == "nodata"){
      fluttergraphdata[0] = "0.7";
    }
  }



   Future<Map<int, String>> fetchskilldata() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: const Duration(seconds: 1),
      ));

      await remoteConfig.fetchAndActivate();
      final fluttergraph = remoteConfig.getString('fluttergraph');
      final iotgraph = remoteConfig.getString('iotgraph');
      final javagraph = remoteConfig.getString('javagraph');
      final firebasegraph = remoteConfig.getString('firebasegraph');

      skilldata[0] = fluttergraph;
      skilldata[1] = iotgraph;
      skilldata[2] = javagraph;
      skilldata[3] = firebasegraph;

      if (fluttergraph.isEmpty  || iotgraph.isEmpty || javagraph.isEmpty || firebasegraph.isEmpty) {
        print("data not found from flutterconfig");
        return skilldata;
      }
      return skilldata;
    } catch (e, stack) {
      print("Remote config fetch error: $e");
      print("Stack trace: $stack");
      return skilldata;
    }
  }
}