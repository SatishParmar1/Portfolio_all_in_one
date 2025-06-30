import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contact_controller with ChangeNotifier{
  List<Map<String, dynamic>> contant = [
    {"name": "Number(978****525)","icon":Icons.call},
    {"name": "Email(satish****gmail.com)","icon":Icons.alternate_email},
    {"name": "Location(Jaipur, Rajasthaan, India)","icon":Icons.location_on_outlined}
  ];

}