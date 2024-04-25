import 'package:flutter/material.dart';
import 'package:hospital_managment/src/model/hospital_details_model.dart';
import 'package:image_picker/image_picker.dart';

class HospitalDetailsController extends ChangeNotifier {
  List<HospitalDetails> hospitalDetails = [];
  bool isImageSelected = false;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFilelist = <XFile>[];
  final hospitalDetailsKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
 

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFilelist.addAll(selectedImages);

      isImageSelected = true;
    }
    notifyListeners();
  }
  
}
