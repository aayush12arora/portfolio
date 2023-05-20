import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:portfolio/Pages/Thankyou_after_hire.dart';

import 'HomePage.dart';


class ContactFormPage extends StatefulWidget {
  int flag=0;
  ContactFormPage(int flag){
    this.flag= flag;
  }
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {



  final _formKey = GlobalKey<FormState>();

  // Form field values
  String _name = '';
  String _email = '';
  String _number= '';
  String _message = '';

  void _sendEmail() async {
    final smtpServer = gmail('aa373@snu.edu.in', 'Ramnath@2412');

    // Create the email message
    final message = Message()
      ..from = Address('aa373@snu.edu.in')
      ..recipients.add('aa373@snu.edu.in') // Replace with your own email address
      ..subject = 'New Contact Form Submission'
      ..text = 'Name: ${_name}\n'
          'Email: ${_email}\n'
          'Message: ${_message}'
           'Contact: ${_number}';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ');
     // _showSuccessDialog();
    } catch (e) {
      print('Error sending email: $e');
      //_showErrorDialog();
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final formDetails = {
          'name': _name,
          'email': _email,
          'message': _message,
          'number':_number,
          'timestamp': Timestamp.now(),
        };

        // Save the form details to Firestore
        await FirebaseFirestore.instance.collection('form_details').add(formDetails);
_sendEmail();
        // After successful form submission, navigate back to the portfolio page
Get.to(Thanks(widget.flag));
      } catch (e) {
        // Handle any errors that occurred during form submission
        print('Error submitting form: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred while submitting the form. Please try again later.'),
              actions: [
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Me'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email validation if needed
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    // Add email validation if needed
                    return null;
                  },
                  onSaved: (value) {
                    _number = value!;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Message'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _message = value!;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to the portfolio page
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    Get.back();
                   // Navigator.pop(context);
                  },
                  child: Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
