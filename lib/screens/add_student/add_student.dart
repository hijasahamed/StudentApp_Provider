import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/screens/text_form_field/text_form_field.dart';

class AddStudent extends StatelessWidget {
   AddStudent({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(21),
            child: Text(
              'Please Enter Details',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
        ),
        body: Consumer(
          builder: (context, value, child) {
            return TextFormFieldWidget(
              formkey: formkey, 
              nameController: nameController, 
              ageController: ageController, 
              phoneController: phoneController, 
              isFromEdit: false
            );
          },
        ));
  }
}