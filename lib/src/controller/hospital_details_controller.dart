import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:hospital_managment/src/model/hospital_details_model.dart';

class HospitalDetailsController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final hospitalDetailsKey = GlobalKey<FormState>();

  List<TextEditingController> timeControllers =
      List.generate(7, (_) => TextEditingController()); 
  List<XFile> imageFilelist = <XFile>[];
  bool isImageSelected = false;


  final TextEditingController numberController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void selectImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFilelist.addAll(selectedImages);
      isImageSelected = true;
      notifyListeners();
    }
  }

  Future<void> addOrUpdateHospitalDetails( context) async {
    if (hospitalDetailsKey.currentState!.validate()) {
      try {
        List<String> times =
            timeControllers.map((controller) => controller.text).toList();

        final hospital = HospitalDetails(
          1,
          number: int.parse(numberController.text),
          about: aboutController.text,
          address: addressController.text,
          time: times,

          image: imageFilelist.map((xfile) => File(xfile.path)).toList(),
        );

        await _firestore
            .collection('hospitalDetails')
            .doc('unique_document_id') 
            .set(hospital.toJson(),
                SetOptions(merge: true)); 

        clearFormControllers();
        Navigator.pop(context);
      } catch (e) {
        print("Error adding hospital details to Firebase: ${e.toString()}");
      }
    }
  }

  void clearFormControllers() {
    numberController.clear();
    aboutController.clear();
    addressController.clear();
    timeControllers.forEach((controller) => controller.clear());
    imageFilelist.clear();
    isImageSelected = false;
    notifyListeners();
  }
}
