import 'package:flutter/material.dart';
import 'package:student_app_provider/db/db_model.dart';


class Editcontroll extends ChangeNotifier {
  void oninit(Studentmodel data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _id = data.id!;
      _namecontroller.text = data.name;
      _agecontroller.text = data.age;
      _phonecontroller.text = data.phone;

      notifyListeners();
    });
  }

  TextEditingController get namecontroller => _namecontroller;

  TextEditingController get agecontroller => _agecontroller;

  TextEditingController get phonecontroller => _phonecontroller;


  TextEditingController _namecontroller = TextEditingController();

  TextEditingController _agecontroller = TextEditingController();

  TextEditingController _phonecontroller = TextEditingController();


  int get id => _id;
  int _id = 0;
  Studentmodel? student;
  Editcontroll({this.student});
}
