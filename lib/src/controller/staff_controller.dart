import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/model/staff_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
   File? imageFile;
      String? imageUrls;
        bool isImageSelected = false;

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

  // Future<void> pickImage() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     profileImage = File(pickedFile.path); 
  //     notifyListeners(); 
  //   }
  // }
  selectImages() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile =File(pickedFile.path);
      uploadImageToFirebase(File(pickedFile.path));
      isImageSelected = true;
      notifyListeners();
      
    } else {
      // Get.snackbar("Error", "Image not selected",
      //     snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  uploadImageToFirebase(File imageFile) async {
    try {
      print("----------------here---------------");
      final ref = FirebaseStorage.instance
          .ref()
          .child("staff_profile")
          .child("${DateTime.now().millisecondsSinceEpoch}");
      final result = await ref.putFile(imageFile);
      final fileUrl = await result.ref.getDownloadURL();
      imageUrls = fileUrl;
    
    } catch (e) {
      // snackbar("error", 'Error in uploading image $e',
      //     snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> addStaffToFirebase(context) async {
    if (staffFormKey.currentState!.validate()) {
      try {
    String formattedDate = DateFormat('dd-MMM-yyyy').format(joiningdate!);
        String Dob = DateFormat('dd-MMM-yyyy').format(dob!);


        await _firestore.collection('staff').add({
          'name': nameController.text,
          'phone_number': int.parse(numberController.text),
          'category': categoryController.text,
          'education': educationController.text,
          'experience': int.parse(experienceController.text),
          'bio': bioController.text,
          'dob': Dob,
          'gender': _dropdownValue == 'One' ? 'Male' : 'Female',
          'profile': imageUrls,
          'joiningdate': formattedDate,
        });
        clearFormControllers(); 
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

}
