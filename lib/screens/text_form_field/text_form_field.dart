import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app_provider/screens/edit_student/edit_controller.dart';
import 'package:student_app_provider/screens/snackbar_functions/snackbar_functions.dart';

class TextFormFieldWidget extends StatelessWidget {

  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController phoneController;

  TextFormFieldWidget({
    super.key,
    required this.formkey,
    required this.nameController,
    required this.ageController,
    required this.phoneController,
    required this.isFromEdit,
     this.editcontroller
  });
  GlobalKey formkey;
  bool isFromEdit;
  Editcontroll? editcontroller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 70,
                      width: double.maxFinite,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.person),
                          labelText: 'Name',
                          fillColor: const Color.fromARGB(255, 56, 56, 56),
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 102)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 70,
                      width: double.maxFinite,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter age';
                          }
                          return null;
                        },
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.date_range),
                          labelText: ' Age',
                          fillColor: Color.fromARGB(255, 56, 56, 56),
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 102)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 70,
                      width: double.maxFinite,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          labelText: 'Phone Number',
                          fillColor: Color.fromARGB(255, 56, 56, 56),
                          filled: true,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 102, 102, 102)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: isFromEdit == true
                          ? ElevatedButton(
                              onPressed: () {
                                update(
                                    context,
                                    editcontroller?.id,
                                    editcontroller?.namecontroller.value,
                                    editcontroller?.agecontroller.value,
                                    editcontroller?.phonecontroller.value,
                                    formkey,
                                    editcontroller,
                                    context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber.shade500),
                              child: const Text(
                                'Update',
                                style: TextStyle(color: Colors.black),
                              ))
                          : ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                Colors.yellow,
                              )),
                              onPressed: () {
                                addstudent(nameController, ageController,
                                    phoneController, formkey, context);
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
