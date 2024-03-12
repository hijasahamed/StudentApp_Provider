import 'package:flutter/material.dart';
import 'package:student_app_provider/screens/add_student/add_student.dart';
import 'package:student_app_provider/screens/list_student/student_list_screen.dart';
import 'package:student_app_provider/screens/search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management (Provider)'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: const Color.fromARGB(255, 32, 33, 33),
                    child: const StudentLisScreen(),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Center(
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                        Colors.yellow,
                      )),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return AddStudent();
                        }));
                      },
                      child: const Text(
                        'Add Student',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                )),
          ],
        ),
      )),
    );
  }
}
