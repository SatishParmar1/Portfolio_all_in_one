import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/textdata/alllink.dart';

class MyworkController with ChangeNotifier{
  final List<Map<String, dynamic>> work = [
    {'name': 'Trend Wave', 'image': Alllink.trendwave, 'link': "https://drive.google.com/file/d/1rVSYGxFFDSulH_nSD8-QUoCf-IA9_CmK/view"},
    {'name': 'Shree Sai', 'image': Alllink.shreesai, 'link': "https://drive.google.com/file/d/1NQ-z8KPD4YIl_-CSoq7L9Ky2SCsGBicP/view?usp=sharing"},
    {'name': 'Proflamingo', 'image': Alllink.proflamingo, 'link': "https://satishparmar1.github.io/Proflamingo/"},
    {'name': 'Sky View', 'image': Alllink.skyview, 'link': "https://drive.google.com/file/d/1mZy8x7E-3vFu-RmhEyVLmf8H6naHR9wC/view"},
    {'name': 'Knee Guard for Blind person', 'image': Alllink.iot1, 'link': "https://drive.google.com/file/d/1U7YaDolHBKtYE0lwaUeoHfv62fsdaMdc/view?usp=sharing"},
    {'name': 'Working in Progress', 'image': Alllink.workinprogress, 'link': ""},
  ];


}