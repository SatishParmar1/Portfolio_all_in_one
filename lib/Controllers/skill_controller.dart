import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/textdata/alllink.dart';

class Skill_controller with ChangeNotifier{
  final List<Map<String, dynamic>> skills = [
    {
      'name': 'Flutter',
      'image': Alllink.flutter,
      'color': Colors.blue,
      'description': 'Cross-platform UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.'
    },
    {
      'name': 'C++',
      'image': Alllink.cpp,
      'color': Colors.black87,
      'description': 'A powerful general-purpose programming language used for system/software development and game programming.'
    },
    {
      'name': 'Java',
      'image': Alllink.java,
      'color': Colors.black87,
      'description': 'A widely-used object-oriented programming language designed for portability and performance.'
    },
    {
      'name': 'Dart',
      'image': Alllink.dart,
      'color': Colors.purple,
      'description': 'A client-optimized language for fast apps on any platform, mainly used with Flutter.'
    },
    {
      'name': 'Sql',
      'image': Alllink.sql,
      'color': Colors.blue,
      'description': 'A standard language for storing, manipulating, and retrieving data in databases.'
    },
    {
      'name': 'Sqlite',
      'image': Alllink.sqlite,
      'color': Colors.blue,
      'description': 'A lightweight, disk-based database that doesn\'t require a separate server process.'
    },
    {
      'name': 'Html',
      'image': Alllink.html,
      'color': Colors.purple,
      'description': 'The standard markup language for creating web pages and web applications.'
    },
    {
      'name': 'CSS',
      'image': Alllink.css,
      'color': Colors.blue,
      'description': 'A style sheet language used for describing the look and formatting of a document written in HTML.'
    },
    {
      'name': 'Firebase',
      'image': Alllink.firebase,
      'color': Colors.blueAccent,
      'description': 'A platform developed by Google for creating mobile and web applications with backend services.'
    },
    {
      'name': 'Android\nstudio',
      'image': Alllink.androidstudio,
      'color': Colors.orange,
      'description': 'The official IDE for Google\'s Android operating system, used for Android app development.'
    },
    {
      'name': 'IoT',
      'image': Alllink.iot,
      'color': Colors.blueAccent,
      'description': 'Internet of Things: Interconnected devices that collect and exchange data.'
    },
    {
      'name': 'Arduino',
      'image': Alllink.arduino,
      'color': Colors.blueAccent,
      'description': 'An open-source electronics platform based on easy-to-use hardware and software.'
    },
    {
      'name': 'Git',
      'image': Alllink.git,
      'color': Colors.black87,
      'description': 'A distributed version-control system for tracking changes in source code during software development.'
    },
    {
      'name': 'Github',
      'image': Alllink.github,
      'color': Colors.blue,
      'description': 'A web-based platform for version control and collaboration using Git.'
    },
    {
      'name': 'Api',
      'image': Alllink.api,
      'color': Colors.purple,
      'description': 'Application Programming Interface: A set of functions and procedures for building software and applications.'
    },
    {
      'name': 'Vscode',
      'image': Alllink.vscode,
      'color': Colors.blue,
      'description': 'A free source-code editor made by Microsoft for Windows, Linux and macOS.'
    },
  ];


}