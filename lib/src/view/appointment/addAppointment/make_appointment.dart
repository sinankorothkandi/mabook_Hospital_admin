// ignore_for_file: camel_case_types

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/controller/appoinment_controller.dart';
import 'package:hospital_managment/src/controller/doctor_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/AddDoctor/custem_textfield.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MakeAppoinment extends StatelessWidget {
  const MakeAppoinment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyblack,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              color: white,
            )),
        centerTitle: true,
        title: const Text(
          'make an appointment',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppointmentController>(
            builder: (context, appointmentcontroller, _) {
          return Form(
            key: appointmentcontroller.appointmentFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      height: 45,
                      width: 175,
                      decoration: const BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Date:',
                            style: TextStyle(color: white, fontSize: 16),
                          ),
                          appointmentcontroller.date == null
                              ? Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(DateTime.now()),
                                  style: const TextStyle(color: Colors.grey),
                                )
                              : Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(appointmentcontroller.date!),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                          IconButton(
                            onPressed: () async {
                              await appointmentcontroller
                                  .showJOINCalendarDialog(context);
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),

                const SizedBox(
                  height: 10,
                ),
                CustomTextFiel(
                    hintText: 'Patient name',
                    titleText: 'Full name',
                    controller: appointmentcontroller.nameController,
                    validatorText: 'a name'),
                CustomTextFiel(
                    hintText: 'enter number',
                    titleText: 'Phone No',
                    controller: appointmentcontroller.numberController,
                    validatorText: 'number'),
                CustomTextFiel(
                    hintText: 'Department',
                    titleText: 'department',
                    controller: appointmentcontroller.departmentController,
                    validatorText: 'department'),
                CustomTextFiel(
                    hintText: 'Doctor',
                    titleText: 'doctor',
                    controller: appointmentcontroller.doctorController,
                    validatorText: 'doctor name'),

                //=========================================================
                Padding(
                  padding: const EdgeInsets.only(
                      left: 29, top: 20, right: 90, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date Of Birth',
                        style: GoogleFonts.poppins(color: white, fontSize: 17),
                      ),
                      Text(
                        'Gender',
                        style: GoogleFonts.poppins(color: white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  const SizedBox(
                    width: 33,
                  ),
                  Container(
                      height: 40,
                      width: 125,
                      decoration: const BoxDecoration(
                        color: bodygrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          appointmentcontroller.dob == null
                              ? Text(
                                  "       DOB   ",
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey),
                                )
                              : Text(
                                  DateFormat('  dd-MM-yy')
                                      .format(appointmentcontroller.dob!),
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey),
                                ),
                          IconButton(
                            onPressed: () async {
                              await appointmentcontroller
                                  .showDOBCalendarDialog(context);
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                      height: 40,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: bodygrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: appointmentcontroller.dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            style: const TextStyle(color: grey),
                            dropdownColor: bodygrey,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                appointmentcontroller
                                    .setDropdownValue(newValue);
                              }
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'One',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Two',
                                child: Text('Female'),
                              ),
                            ],
                          ),
                        ),
                      )),
                ]),
                //===============================================================================

                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 282,
                  ),
                  child: Text(
                    'Address',
                    style: GoogleFonts.poppins(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: appointmentcontroller.addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      hintText: 'address',
                      hintStyle: GoogleFonts.poppins(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a address';
                      }
                      return null;
                    },
                    style: const TextStyle(color: grey),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (appointmentcontroller
                              .appointmentFormKey.currentState!
                              .validate()) {
                            appointmentcontroller
                                .addappoinmentToFirebase(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: green,
                        ),
                        child: const Text(
                          "Add Appointment",
                          style: TextStyle(color: white, fontSize: 18),
                        ),
                      ),
                    )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
