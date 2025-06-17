import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skill_controller with ChangeNotifier{
  final List<Map<String, dynamic>> skills = const [
    {'name': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'Firebase', 'icon': Icons.local_fire_department, 'color': Colors.orange},
    {'name': 'Provider', 'icon': Icons.settings, 'color': Colors.purple},
    {'name': 'REST API', 'icon': Icons.public, 'color': Colors.blueAccent},
    {'name': 'UI/UX', 'icon': Icons.palette, 'color': Colors.black87},
    {'name': 'Auth', 'icon': Icons.lock, 'color': Colors.blue},
  ];


}