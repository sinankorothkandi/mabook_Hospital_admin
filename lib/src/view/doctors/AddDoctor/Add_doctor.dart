// ignore_for_file: camel_case_types

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/controller/doctor_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/AddDoctor/custem_textfield.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class doctor_add extends StatelessWidget {
  final String departments;
  const doctor_add({super.key, required this.departments});

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
          'Add Doctor',
          style: TextStyle(color: white),
        ),
      ),
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
                GestureDetector(
                  onTap: () {
                    doctorcontroller.pickImage();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: doctorcontroller.profileImage != null
                        ? FileImage(doctorcontroller.profileImage!)
                        : null,
                    backgroundColor:
                        doctorcontroller.profileImage == null ? bodygrey : null,
                    child: doctorcontroller.profileImage == null
                        ? const Icon(
                            Icons.add_photo_alternate,
                            color: grey,
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      height: 45,
                      width: 225,
                      decoration: const BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Joining Date:',
                            style: TextStyle(color: white, fontSize: 16),
                          ),
                          doctorcontroller.joiningdate == null
                              ? Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(DateTime.now()),
                                  style: const TextStyle(color: Colors.grey),
                                )
                              : Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(doctorcontroller.joiningdate!),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                          IconButton(
                            onPressed: () async {
                              await doctorcontroller
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, right: 190),
                  child: Text(
                    "Selected Department",
                    style: GoogleFonts.poppins(fontSize: 17, color: white),
                  ),
                ),
                Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: bodygrey),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Text(
                      departments,
                      style: GoogleFonts.poppins(fontSize: 17, color: white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFiel(
                    hintText: 'enter name',
                    titleText: 'Full name',
                    controller: doctorcontroller.nameController,
                    validatorText: 'a name'),
                CustomTextFiel(
                    hintText: 'enter number',
                    titleText: 'Phone No',
                    controller: doctorcontroller.numberController,
                    validatorText: 'number'),
                CustomTextFiel(
                    hintText: 'enter IMR register no',
                    titleText: 'IMR Register no',
                    controller: doctorcontroller.imrregisternoController,
                    validatorText: 'a IMR register no'),
                CustomTextFiel(
                    hintText: 'Experience',
                    titleText: 'Experience(In Year)',
                    controller: doctorcontroller.experienceController,
                    validatorText: 'Experience'),
                CustomTextFiel(
                    hintText: 'State Medical Council',
                    titleText: 'State Medical Council',
                    controller: doctorcontroller.statemedicalcouncilController,
                    validatorText: 'State Medical Council'),
                CustomTextFiel(
                    hintText: '0.0',
                    titleText: 'Consultancy Fees',
                    controller: doctorcontroller.consultancyfeesController,
                    validatorText: 'Consultancy Fees'),
                CustomTextFiel(
                    hintText: 'Education',
                    titleText: 'Education',
                    controller: doctorcontroller.educationController,
                    validatorText: 'Education'),
                CustomTextFiel(
                    hintText: 'specialize in',
                    titleText: 'specialize in',
                    controller: doctorcontroller.specializeinController,
                    validatorText: 'specialize in'),
                //=========================================================
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 20, right: 119, bottom: 15),
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
                      height: 45,
                      width: 125,
                      decoration: const BoxDecoration(
                        color: bodygrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          doctorcontroller.dob == null
                              ? Text(
                                  "       DOB   ",
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey),
                                )
                              : Text(
                                  DateFormat('  dd-MM-yy')
                                      .format(doctorcontroller.dob!),
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey),
                                ),
                          IconButton(
                            onPressed: () async {
                              await doctorcontroller
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
                    width: 80,
                  ),
                  Container(
                      height: 45,
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
                            value: doctorcontroller.dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            style: const TextStyle(color: grey),
                            dropdownColor: bodygrey,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                doctorcontroller.setDropdownValue(newValue);
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
                    right: 212,
                  ),
                  child: Text(
                    'Professional Bio',
                    style: GoogleFonts.poppins(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: doctorcontroller.bioController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      hintText: 'bio',
                      hintStyle: GoogleFonts.poppins(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a bio';
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
                          if (doctorcontroller.doctorFormKey.currentState!
                              .validate()) {
                            doctorcontroller.addDoctorToFirebase(context);
                            doctorcontroller.department = departments;
                         
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: green,
                        ),
                        child: const Text(
                          "Add Doctor",
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
