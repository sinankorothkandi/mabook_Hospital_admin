// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/model/department_model.dart';

class departmentController extends ChangeNotifier {
    final TextEditingController depadmentController = TextEditingController();

  final DepartmentModel = departmentModel(departmentName: []);
  addDepatment() {
    FirebaseFirestore.instance.collection('departments').add({
      "Departmentname": depadmentController.text,
    });
     notifyListeners();
  }
}
