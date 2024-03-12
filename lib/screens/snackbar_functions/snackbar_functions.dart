import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/db/db_model.dart';
import 'package:student_app_provider/provider/student_controller.dart';

snackbar(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 249, 246, 246),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black),
    ),
  ));
}

Future<void> addstudent(namecontroller, agecontroller, phonecontroller,formkey, context) async {
  final control = Provider.of<Studentcontoller>(context, listen: false);
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();

  if (formkey.currentState!.validate()) {
    final studentvalues = Studentmodel(
      name: name,
      age: age,
      phone: phone,
    );

    await control.addstudent1(studentvalues);
    namecontroller.text = '';
    agecontroller.text = '';
    phonecontroller.text = '';
    Navigator.of(context).pop();
    snackbar('Details Submitted', context);
  } else {
    snackbar('Please Add Details', context);
  }
}


Future<void> update(
    ctx,
    id,
    namecontroller,
    agecontroller,
    phonecontroller,
    keybottom,
    editcontroller,
    context) async {
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final phone = phonecontroller.text.trim();

  if (keybottom.currentState!.validate()) {
    await Provider.of<Studentcontoller>(context, listen: false).updatestudent(
      id,
      name,
      age,
      phone,
    );
    Navigator.of(context).pop();
    editcontroller.namecontroller.text = '';
    editcontroller.agecontroller.text = '';
    editcontroller.phonecontroller.text = '';

    snackbar('Details Updated', context);
  }
}
