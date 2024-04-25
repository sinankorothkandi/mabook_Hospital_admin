import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/model/staff_model.dart';
import 'package:image_picker/image_picker.dart';

class Staffcontroller extends ChangeNotifier {
  List<StaffModel> staffModel = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final staffFormKey = GlobalKey<FormState>();
  File? profileImage;
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  // final TextEditingController joiningDateController = TextEditingController(); // New
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
      notifyListeners(); // Notify listeners when `dob` is updated
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
      notifyListeners(); // Notify listeners when `dob` is updated
    }
    return pickedDate;
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path); // Store the picked image
      notifyListeners(); // Notify the UI to update
    }
  }

  Future<void> addStaffToFirebase(context) async {
    if (staffFormKey.currentState!.validate()) {
      try {
        await _firestore.collection('staff').add({
          'name': nameController.text,
          'phone_number': int.parse(numberController.text),
          'category': categoryController.text,
          'education': educationController.text,
          'experience': int.parse(experienceController.text),
          'bio': bioController.text,
          'dob': dob?.toIso8601String(),
          'gender': _dropdownValue == 'One' ? 'Male' : 'Female',
          'profile': profileImage?.path ?? '',
          'joiningdate': joiningdate?.toIso8601String(),
        });
        clearFormControllers(); // Clear controllers after adding
      } catch (e) {
        print('Error adding staff to Firebase: $e');
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

  //   // Function to fetch all staff data from Firestore
  // Stream<List<StaffModel>> fetchStaffFromFirebase() {
  //   return _firestore.collection('staff').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       final data = doc.data();
  //       return StaffModel(
  //         id: doc.id.hashCode, // Unique ID from Firebase
  //         name: data['name'],
  //         phoneNumber: data['phone_number'],
  //         category: data['category'],
  //         education: data['education'],
  //         experience: data['experience'],
  //         bio: data['bio'],
  //         dob: data['dob'] ?? '', // If DOB is missing, return an empty string
  //         gender: data['gender'] == 'Male', // Boolean based on gender string
  //       );
  //     }).toList();
  //   });
  // }
}
