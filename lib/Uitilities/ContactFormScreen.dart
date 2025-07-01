import 'package:flutter/material.dart';
import 'package:portfolio/Controllers/contactformcontroller.dart';
import 'package:provider/provider.dart';

class ContactFormScreen extends StatefulWidget {
  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();


  InputDecoration _inputDecoration(String label, FocusNode focusNode, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      suffixIcon: Icon(icon,color: Colors.white70,),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.length > 30) return 'Name must be <= 30 characters';
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(value)) return 'Only alphabets allowed';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    if (!regex.hasMatch(value)) return 'Enter valid email';
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value.trim().isEmpty) return 'Number is required';
    final regex = RegExp(r'^\d{10}$');
    if (!regex.hasMatch(value)) return 'Enter 10 digit number';
    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) return 'Message is required';
    return null;
  }

  void handleSubmit(Contactformcontroller provider,BuildContext context) {
    if (_formKey.currentState!.validate()) {
      provider.Sendemail(context);
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
      // Errors will show automatically
    }
  }

  @override
  Widget build(BuildContext context) {
    final spacing = SizedBox(height: 15);

    return
      Consumer<Contactformcontroller>(
        builder: (context,provider,child) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: provider.nameController,
                      focusNode: provider.nameFocus,
                      decoration: _inputDecoration(
                          'Name', provider.nameFocus, Icons.person_2_outlined),
                      validator: _validateName,
                    ),
                    spacing,
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: provider.emailController,
                      focusNode: provider.emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputDecoration(
                          'Email', provider.emailFocus, Icons.email_outlined),
                      validator: _validateEmail,
                    ),
                    spacing,
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: provider.numberController,
                      focusNode:provider.numberFocus,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration(
                          'Phone Number', provider.numberFocus, Icons.numbers_outlined),
                      validator: _validateNumber,
                    ),
                    spacing,
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: provider.messageController,
                      focusNode: provider.messageFocus,
                      minLines: 2,
                      maxLines: 4,
                      decoration: _inputDecoration(
                          'Message', provider.messageFocus, Icons.message_outlined),
                      validator: _validateMessage,
                    ),
                    spacing,
                    ElevatedButton(
                      onPressed: (){handleSubmit(provider,context);},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        elevation: 2,
                        padding: EdgeInsets.symmetric(
                            vertical: 16, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      );
  }
}
