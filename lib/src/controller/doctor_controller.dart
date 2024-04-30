import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/model/doctor_model.dart';
import 'package:image_picker/image_picker.dart';

class DoctorController extends ChangeNotifier {
  List<DoctorModel> doctorModel = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final doctorFormKey = GlobalKey<FormState>();
  File? profileImage;
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController imrregisternoController = TextEditingController();
  final TextEditingController consultancyfeesController =
      TextEditingController();
  final TextEditingController specializeinController = TextEditingController();
  String? department;
  final TextEditingController statemedicalcouncilController =
      TextEditingController();
  DateTime? dob;
  DateTime? joiningdate;

  String _dropdownValue = 'One';
  String get dropdownValue => _dropdownValue;

  void setDropdownValue(String newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }


  Future<DateTime?> showDOBCalendarDialog(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: dob ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      dob = pickedDate;
      notifyListeners();
    }
    return pickedDate;
  }

  Future<DateTime?> showJOINCalendarDialog(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: joiningdate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      joiningdate = pickedDate;
      notifyListeners();
    }
    return pickedDate;
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> addDoctorToFirebase(context) async {
    if (doctorFormKey.currentState!.validate()) {
      try {
        await _firestore.collection('doctoreCollection').add({
          'name': nameController.text,
          'phone_number': int.parse(numberController.text),
         
          'education': educationController.text,
          'experience': int.parse(experienceController.text),
          'bio': bioController.text,
          'specializein': specializeinController.text,
          'consultancyfees': int.parse(consultancyfeesController.text),
          'statemedicalcouncil': statemedicalcouncilController.text,
          'imrregisterno': int.parse(imrregisternoController.text),
          'dob': dob?.toIso8601String(),
          'gender': _dropdownValue == 'One' ? 'Male' : 'Female',
          'profile': profileImage?.path ?? '',
          'joiningdate': joiningdate?.toIso8601String(),
          'department': department,
        });
        clearFormControllers();
      } catch (e) {
        print('Error adding doctor to Firebase: $e');
      }
      Navigator.pop(context);
    }
  }

  void clearFormControllers() {
    numberController.clear();
    nameController.clear();
    categoryController.clear();
    educationController.clear();
    experienceController.clear();
    bioController.clear();
    dob = null;
    joiningdate = null;
    profileImage = null;
    notifyListeners();
  }
}