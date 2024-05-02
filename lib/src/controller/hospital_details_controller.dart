import 'package:firebase_storage/firebase_storage.dart';
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
  List<File> imageFilelist = [];
  bool isImageSelected = false;
  bool isLoading = false;
  List<String> imageUrls = [];

  final TextEditingController numberController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


  selectImages() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFilelist.add(File(pickedFile.path));
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
          .child("images")
          .child("${DateTime.now().millisecondsSinceEpoch}");
      isLoading = true;
      final result = await ref.putFile(imageFile);
      final fileUrl = await result.ref.getDownloadURL();
      imageUrls.add(fileUrl);
      print(imageUrls);
      isLoading = false;
      // Get.snackbar("Success", 'Image ${imageUrls.length} successfully saved',
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: AppThemeData.green);
    } catch (e) {
      // snackbar("error", 'Error in uploading image $e',
      //     snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> addOrUpdateHospitalDetails(context) async {
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
          image: imageUrls,
        );

        await _firestore
            .collection('hospitalDetails')
            .doc('unique_document_id')
            .set(hospital.toJson(), SetOptions(merge: true));

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
