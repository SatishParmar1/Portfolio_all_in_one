import 'package:flutter/material.dart';

class ContactFormScreen extends StatefulWidget {
  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _messageController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _numberFocus = FocusNode();
  final FocusNode _messageFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _messageController.dispose();

    _nameFocus.dispose();
    _emailFocus.dispose();
    _numberFocus.dispose();
    _messageFocus.dispose();
    super.dispose();
  }

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

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // If all validations pass
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully')),
      );
    } else {
      // Errors will show automatically
    }
  }

  @override
  Widget build(BuildContext context) {
    final spacing = SizedBox(height: 15);

    return
      Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: _nameController,
                  focusNode: _nameFocus,
                  decoration: _inputDecoration('Name', _nameFocus,Icons.person_2_outlined),
                  validator: _validateName,
                ),
                spacing,
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email', _emailFocus,Icons.email_outlined),
                  validator: _validateEmail,
                ),
                spacing,
                TextFormField(
                  controller: _numberController,
                  focusNode: _numberFocus,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration('Phone Number', _numberFocus,Icons.numbers_outlined),
                  validator: _validateNumber,
                ),
                spacing,
                TextFormField(
                  controller: _messageController,
                  focusNode: _messageFocus,
                  minLines: 2,
                  maxLines: 4,
                  decoration: _inputDecoration('Message', _messageFocus,Icons.message_outlined),
                  validator: _validateMessage,
                ),
                spacing,
                ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                    elevation: 2,
                    padding: EdgeInsets.symmetric(vertical: 16,horizontal: 40),
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
}
