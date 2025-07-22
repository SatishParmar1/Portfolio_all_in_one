import 'package:flutter/cupertino.dart';
import 'package:portfolio/textdata/alllink.dart';

class Experience_Controller with ChangeNotifier {
  String currentExperienceDuration = '';
  List<Map<String, dynamic>> _experiencedata = [];

  List<Map<String, dynamic>> get experiencedata => _experiencedata;

  Experience_Controller() {
    loadExperienceData();
  }

  String getMonthDayDifference(DateTime from, DateTime to) {
    int yearDiff = to.year - from.year;
    int monthDiff = to.month - from.month + (yearDiff * 12);
    DateTime monthStart = DateTime(from.year, from.month + monthDiff);
    int dayDiff = to.difference(monthStart).inDays;
    return '$monthDiff mons';
  }

  String findmonth() {
    DateTime from = DateTime(2025, 1, 1);
    DateTime to = DateTime.now();
    String difference = getMonthDayDifference(from, to);
    return difference;
  }

  void loadExperienceData() {
    currentExperienceDuration = findmonth();
    _experiencedata = [
      {
        "title": "Regrip India PVT.LTD.",
        "subtitle": "Flutter Developer",
        "images": Alllink.regriplogo,
        "url": "https://regrip.in/",
        "date": "Jan 2025 - Present . $currentExperienceDuration"
      },
      {
        "title": "SmartInternz",
        "subtitle": "Salesforce Developer Intern",
        "images": Alllink.smartinternzlogo,
        "url": "https://smartinternz.com/",
        "date": "Jul 2024 - Aug 2024 . 2 mons"
      },
      {
        "title": "Celebal Technology",
        "subtitle": "Cloud Infra and Security Intern",
        "images": Alllink.celeballogo,
        "url": "https://celebaltech.com/",
        "date": "May 2024 - Jul 2024 . 3 mons"
      },
      {
        "title": "GDSC Poornima",
        "subtitle": "GDSC Android Lead",
        "images": Alllink.gdsclogo,
        "url": "https://developers.google.com/community",
        "date": "Oct 2023 - Jul 2024 . 10 mons"
      },
      {
        "title": "Learn and Build",
        "subtitle": "Flutter Developer Intern",
        "images": Alllink.learnandbuildlogo,
        "url": "https://learnandbuild.in/",
        "date": "Aug 2023 - Oct 2023 . 3 mons"
      },
      {
        "title": "Internshala",
        "subtitle": "Internshala Training Partner",
        "images": Alllink.internshalalogo,
        "url": "https://internshala.com/",
        "date": "May 2023 - Jul 2023 . 3 mons"
      },
    ];
    notifyListeners();
  }
}