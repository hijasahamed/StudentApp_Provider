class Studentmodel {
  int? id;
  final String name;
  final String age;
  final String phone;

  Studentmodel(
      {required this.name,
      required this.age,
      required this.phone,
      this.id});
  static Studentmodel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    final phone = map['phone'] as String;

    return Studentmodel(
      id: id,
      name: name,
      age: age,
      phone: phone,
    );
  }
}
