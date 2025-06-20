import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/textdata/alllink.dart';

class MyworkController with ChangeNotifier{
  final List<Map<String, dynamic>> work = [
    {
      'name': 'Trend Wave',
      'image': Alllink.trendwave,
      'description': 'E-commerce app with clean UI and smooth animations. Features include cart management, wishlist, and secure payments.',
      'link': "https://drive.google.com/file/d/1rVSYGxFFDSulH_nSD8-QUoCf-IA9_CmK/view"
    },
    {
      'name': 'Shree Sai',
      'image': Alllink.shreesai,
      'description': 'Temple management app with donation tracking and event scheduling. Includes live darshan and prasad booking features.',
      'link': "https://drive.google.com/file/d/1NQ-z8KPD4YIl_-CSoq7L9Ky2SCsGBicP/view?usp=sharing"
    },
    {
      'name': 'Proflamingo',
      'image': Alllink.proflamingo,
      'description': 'Professional portfolio website template with responsive design. Built with modern web technologies and animations.',
      'link': "https://satishparmar1.github.io/Proflamingo/"
    },
    {
      'name': 'Sky View',
      'image': Alllink.skyview,
      'description': 'Weather forecast app with real-time updates and interactive maps. Features detailed weather information and alerts.',
      'link': "https://drive.google.com/file/d/1mZy8x7E-3vFu-RmhEyVLmf8H6naHR9wC/view"
    },
    {
      'name': 'Knee Guard for Blind person',
      'image': Alllink.iot1,
      'description': 'IoT-based assistive device for visually impaired. Uses sensors to detect obstacles and provide haptic feedback.',
      'link': "https://drive.google.com/file/d/1U7YaDolHBKtYE0lwaUeoHfv62fsdaMdc/view?usp=sharing"
    },
    {
      'name': 'Working in Progress',
      'image': Alllink.workinprogress,
      'description': 'New exciting project under development. Stay tuned for updates and features.',
      'link': ""
    },
  ];

  bool showdiscription = false;
  void showdiscriptiondata(){
    showdiscription = !showdiscription;
    notifyListeners();
  }


}