import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/textdata/alllink.dart';

class MyworkController with ChangeNotifier{
  final List<Map<String, dynamic>> work = [
    {
      'name': 'Trend Wave',
      'image': Alllink.trendwave,
      'description': 'The Trend Wave App is a dynamic news platform built with Flutter, designed to deliver current news by fetching real-time data from the Open News API.',
      'link': "https://drive.google.com/file/d/1rVSYGxFFDSulH_nSD8-QUoCf-IA9_CmK/view"
    },
    {
      'name': 'Shree Sai',
      'image': Alllink.shreesai,
      'description': 'The Shree Sai Chemist App is a comprehensive e-commerce solution developed using Flutter. It allows users to conveniently order medicines and other products directly from their local chemist.',
      'link': "https://drive.google.com/file/d/1NQ-z8KPD4YIl_-CSoq7L9Ky2SCsGBicP/view?usp=sharing"
    },
    {
      'name': 'Proflamingo',
      'image': Alllink.proflamingo,
      'description': 'Proflamingo is an educational web platform created for colleges and schools to provide a secure environment where teachers can conduct student tests. In addition to testing, the site helps students prepare for placements.',
      'link': "https://satishparmar1.github.io/Proflamingo/"
    },
    {
      'name': 'Sky View',
      'image': Alllink.skyview,
      'description': 'a dynamic weather forecasting feature by integrating the Open Weather API. The function pinpoints a users location using latitude and longitude to deliver precise, real-time weather data.',
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