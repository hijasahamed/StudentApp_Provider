import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/provider/student_controller.dart';
import 'package:student_app_provider/screens/edit_student/edit_controller.dart';
import 'package:student_app_provider/screens/home_screen/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Studentcontoller()),
        ChangeNotifierProvider(create: (context) => Editcontroll()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}