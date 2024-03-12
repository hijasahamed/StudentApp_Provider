import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/db_model.dart';
import 'package:student_app_provider/screens/edit_student/edit_controller.dart';
import 'package:student_app_provider/screens/text_form_field/text_form_field.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key,this.stdDetails});

  Studentmodel? stdDetails;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Consumer<Editcontroll>(
        builder: (context,value,child){
          return TextFormFieldWidget(
            formkey: formKey, 
            nameController: value.namecontroller, 
            ageController: value.agecontroller, 
            phoneController: value.phonecontroller, 
            isFromEdit: true,
            editcontroller: value,
          );
        }
      ),
    );
  }
}