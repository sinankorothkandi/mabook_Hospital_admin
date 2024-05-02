
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/model/appointmentModel.dart';
import 'package:intl/intl.dart';

class AppointmentController extends ChangeNotifier {
  List<AppointmentModel> doctorModel = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final doctorFormKey = GlobalKey<FormState>();
  DateTime? dob;
  DateTime? date;
  final appointmentFormKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController doctorController = TextEditingController();

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
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      date = pickedDate;
      notifyListeners();
    }
    return pickedDate;
  }

  Future<void> addappoinmentToFirebase(context) async {
    if (appointmentFormKey.currentState!.validate()) {
      try {
        String Date = DateFormat('dd-MMM-yyyy').format(date!);
        String Dob = DateFormat('dd-MMM-yyyy').format(dob!);

        await _firestore.collection('appoinments').add({
          'name': nameController.text,
          'phone_number': int.parse(numberController.text),
          'address': addressController.text,
          'doctor': doctorController.text,
          'department': departmentController.text,
          'dob': Dob,
          'gender': _dropdownValue == 'One' ? 'Male' : 'Female',
          'date': Date,
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
    addressController.clear();
    departmentController.clear();
    doctorController.clear();
    dob = null;
    date = null;
    notifyListeners();
  }
}
