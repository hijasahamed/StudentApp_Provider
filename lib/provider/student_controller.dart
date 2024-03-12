import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_app_provider/db/db_model.dart';

class Studentcontoller extends ChangeNotifier {
  late Database _db;

  final List<Studentmodel> _students = [];

  Studentcontoller() {
    initializingdatabase();
    if (kDebugMode) {
      print('initialization done');
    }
  }

  Future<void> initializingdatabase() async {
    _db = await openDatabase('student.db', version: 1,
        onCreate: (Database db, int version) {
      db.execute('CREATE TABLE student(id INTEGER PRIMARY KEY ,name TEXT ,age TEXT ,phone TEXT)');
    });
    getallstudent();
  }

  Future<void> addstudent1(Studentmodel value) async {
    await _db.rawInsert(
        'INSERT INTO student(name,age,phone)VALUES(?,?,?)',
        [value.name, value.age, value.phone]);

    getallstudent();
    notifyListeners();
  }

  List<Studentmodel> get students => _students;

  Future<void> getallstudent() async {
    final values = await _db.rawQuery('SELECT * FROM student');
    _students.clear();
    for (var map in values) {
      final student = Studentmodel.fromMap(map);
      _students.add(student);
    }
    notifyListeners();
  }

  Future<void> deletestudent(int id) async {
    await _db.delete("student", where: "id=?", whereArgs: [id]);
    getallstudent();
  }

  Future<void> updatestudent(int id, String name, String age, String phone,) async {
    final data = {
      'name': name,
      'age': age,
      'phone': phone,
    };
    await _db.update('student', data, where: 'id=?', whereArgs: [id]);
    getallstudent();
  }
}
