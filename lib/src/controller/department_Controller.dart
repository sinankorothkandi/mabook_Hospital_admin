import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_managment/src/model/department_model.dart';

class DepartmentController extends ChangeNotifier {
  List<Department> departments = [];

  DepartmentController() {
    fetchDepartments();
  }

  Future<void> fetchDepartments() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('departments')
        .get();

    departments = snapshot.docs.map((doc) => Department.fromFirestore(doc)).toList();
    notifyListeners();
  }

  void addDepartment(String name) {
    FirebaseFirestore.instance.collection('departments').add({
      "Departmentname": name,
    });

    departments.add(Department("", name));
    notifyListeners();
  }
}
