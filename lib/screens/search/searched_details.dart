import 'package:flutter/material.dart';
import 'package:student_app_provider/db/db_model.dart';

class SearchedDetails extends StatelessWidget {
  const SearchedDetails({super.key,required this.student});

  final Studentmodel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color.fromARGB(255, 43, 48, 46),
              height: 70,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('NAME :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  Text(student.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color.fromARGB(255, 43, 48, 46),
              height: 70,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AGE :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  Text(student.age,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color.fromARGB(255, 43, 48, 46),
              height: 70,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PHONE :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  Text(student.phone,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}