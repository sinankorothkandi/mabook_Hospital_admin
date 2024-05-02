


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/controller/doctor_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/AddDoctor/adddoctor/add_doctor_widgets.dart';
import 'package:provider/provider.dart';

class DoctorAdd extends StatelessWidget {
  final String departments;
  const DoctorAdd({super.key, required this.departments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyblack,
      appBar: Appbar(context),
      body: SingleChildScrollView(
        child:
            Consumer<DoctorController>(builder: (context, doctorcontroller, _) {
          return Form(
            key: doctorcontroller.doctorFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                imageselector(doctorcontroller),
                const SizedBox(
                  height: 20,
                ),
                joiningdateSelecter(doctorcontroller, context),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, right: 190),
                  child: Text(
                    "Selected Department",
                    style: GoogleFonts.poppins(fontSize: 17, color: white),
                  ),
                ),
                departmentDisplay(departments),
                const SizedBox(
                  height: 20,
                ),
                enterDetailsMethod(doctorcontroller, context),
                dataSavingButton(doctorcontroller, context,departments),
              ],
            ),
          );
        }),
      ),
    );
  }


 

}
