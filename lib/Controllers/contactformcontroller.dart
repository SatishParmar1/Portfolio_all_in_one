import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as https;
import 'package:flutter/cupertino.dart';

class Contactformcontroller with ChangeNotifier{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final messageController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode numberFocus = FocusNode();
  final FocusNode messageFocus = FocusNode();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    messageController.dispose();

    nameFocus.dispose();
    emailFocus.dispose();
    numberFocus.dispose();
    messageFocus.dispose();
    super.dispose();
  }

  bool formloading = false;
  Future<void> Sendemail (BuildContext context)async{
    formloading = true;
    notifyListeners();

    final url = Uri.parse("https://portfolio-backend-p6pd.onrender.com/send-email");

    try {
      final response = await https.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "from": "satishparmarparmar486@gmail.com",
          "to": emailController.text,
          "body": messageController.text,
          "name": nameController.text,
          "phone": numberController.text,
          "email": emailController.text
        }),
      );

      final  jsonResponse = json.decode(response.body);
      print("Response data: $jsonResponse"); // Debug print

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form submitted successfully'),
            closeIconColor: Colors.white,
            showCloseIcon: true,
            backgroundColor: Colors.green,
            elevation: 1,),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all data'),
            closeIconColor: Colors.white,
            showCloseIcon: true,
            backgroundColor: Colors.red,
            elevation: 1,),
        );
        print(response.statusCode);
      }
      formloading = false;
      notifyListeners();
    } catch (error) {
      formloading = false;
      notifyListeners();
      print('Error fetching data: $error');

    }
    formloading = false;
    notifyListeners();
  }
}