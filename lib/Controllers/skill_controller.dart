import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/textdata/alllink.dart';

class Skill_controller with ChangeNotifier{
  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'image': Alllink.flutter, 'color': Colors.blue},
    {'name': 'C++', 'image':Alllink.cpp, 'color': Colors.black87},
    {'name': 'Java', 'image':Alllink.java, 'color': Colors.black87},
    {'name': 'Dart', 'image': Alllink.dart, 'color': Colors.purple},
    {'name': 'Sql', 'image': Alllink.sql, 'color': Colors.blue},
    {'name': 'Sqlite', 'image': Alllink.sqlite, 'color': Colors.blue},
    {'name': 'Html', 'image': Alllink.html, 'color': Colors.purple},
    {'name': 'CSS', 'image': Alllink.css, 'color': Colors.blue},
    {'name': 'Firebase', 'image': Alllink.firebase, 'color': Colors.blueAccent},
    {'name': 'Android\nstudio', 'image': Alllink.androidstudio, 'color': Colors.orange},
    {'name': 'IoT', 'image': Alllink.iot, 'color': Colors.blueAccent},
    {'name': 'Arduino', 'image': Alllink.arduino, 'color': Colors.blueAccent},
    {'name': 'Git', 'image':Alllink.git, 'color': Colors.black87},
    {'name': 'Github', 'image': Alllink.github, 'color': Colors.blue},
    {'name': 'Api', 'image': Alllink.api, 'color': Colors.purple},
    {'name': 'Vscode', 'image': Alllink.vscode, 'color': Colors.blue},
  ];


}