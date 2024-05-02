import 'package:flutter/material.dart';
import 'package:hospital_managment/src/controller/department_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/department/department_widget.dart';
import 'package:provider/provider.dart';

class SelectDepartment extends StatelessWidget {
  final TextEditingController departmentNameController =
      TextEditingController();

  SelectDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    final departmentController = Provider.of<DepartmentController>(context);

    return Scaffold(
      backgroundColor: bodyblack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bodyblack,
        title: const Text(
          "Select Department",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 190, top: 30),
              child: Text(
                'Select Department',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            departmentRetriving(),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  showModelBottemSheet(
                      context, departmentController, departmentNameController);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19)),
                  minimumSize: const Size(0, 50),
                  backgroundColor: bodygrey,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add_circle_rounded, color: grey),
                    SizedBox(width: 40),
                    Text(
                      'Add Department',
                      style: TextStyle(color: grey, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
