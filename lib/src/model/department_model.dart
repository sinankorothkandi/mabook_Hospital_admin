import 'package:cloud_firestore/cloud_firestore.dart';

class Department {
  final String id;
  final String name;

  Department(this.id, this.name);

  Department.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,
        name = doc['Departmentname'];
}