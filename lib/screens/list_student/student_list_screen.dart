import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/provider/student_controller.dart';
import 'package:student_app_provider/screens/edit_student/edit_student.dart';
import 'package:student_app_provider/screens/search/searched_details.dart';
import 'package:student_app_provider/screens/snackbar_functions/snackbar_functions.dart';

class StudentLisScreen extends StatelessWidget {
  const StudentLisScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Consumer<Studentcontoller>(
     builder: (context,value,child){
      final values=value.students;
      return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = values[index];
              return InkWell(
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return SearchedDetails(student: data);
                  }));
                },
                child: Card(
                  color: const Color.fromARGB(255, 43, 56, 63),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${data.name}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Age : ${data.age}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Phone : ${data.phone}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                                      return EditScreen();
                                    }));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor:
                                              const Color.fromARGB(255, 43, 56, 63),
                                          content: const Text(
                                            'Do you want to delete?',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  value.deletestudent(data.id!);
                                                  Navigator.of(context).pop();
                                                  snackbar('Deleted', context);
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 253, 17, 0),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 1,
              );
            },
            itemCount: values.length);
     }
   );
  }
}