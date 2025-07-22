import 'package:flutter/cupertino.dart';

import '../textdata/alllink.dart';

class Education_controller with ChangeNotifier {
  List<Map<String, dynamic>> educationdata = [
    {
      "title": "Poornima Institute of Engineering and Technology Jaipur",
      "subtitle": "B.Tech CSE",
      "images": Alllink.pietlogo,
      "url": "https://www.poornima.org",
      "date": "Oct 2021 - Apr 2025 . 3 years 7 mons",
    },
    {
      "title": "Noble School Falna",
      "subtitle": "PCM",
      "images": Alllink.nobleschoollogo,
      "url": "https://rnpsfalna.in",
      "date": "Jul 2019 - Jun 2021 . 2 years",
    },
  ];
}
