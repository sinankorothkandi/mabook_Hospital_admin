import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_managment/src/controller/staff_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class staff_add extends StatelessWidget {
  staff_add({super.key});

  String dropdownValue = 'One';

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
          'Add Staff',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<Staffcontroller>(
            builder: (BuildContext context, Staffcontroller stafcontroller, _) {
          return Form(
            key: stafcontroller.staffFormKey,
            child: Column(
              children: [
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
                          stafcontroller.dob == null
                              ? Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(DateTime.now()),
                                  style: const TextStyle(color: Colors.grey),
                                )
                              : Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(stafcontroller.dob!),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                          IconButton(
                            onPressed: () async {
                              await stafcontroller
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
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    stafcontroller.pickImage();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: stafcontroller.profileImage != null
                        ? FileImage(stafcontroller.profileImage!)
                        : null, 
                    child: stafcontroller.profileImage == null
                        ? const Icon(Icons.add_photo_alternate)
                        : null, 
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 35,
                    right: 285,
                  ),
                  child: Text(
                    'Full Name',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: stafcontroller.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      contentPadding: const EdgeInsets.only(left: 30),
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    style: const TextStyle(color: grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 289,
                  ),
                  child: Text(
                    'Phone No',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: stafcontroller.numberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      contentPadding: const EdgeInsets.only(left: 30),
                      hintText: 'number',
                      hintStyle: const TextStyle(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                    style: const TextStyle(color: grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 295,
                  ),
                  child: Text(
                    'Category',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: stafcontroller.categoryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      contentPadding: const EdgeInsets.only(left: 30),
                      hintText: 'Category',
                      hintStyle: const TextStyle(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Category';
                      }
                      return null;
                    },
                    style: const TextStyle(color: grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 25, top: 20, right: 135, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date Of Birth',
                        style: TextStyle(color: white, fontSize: 17),
                      ),
                      Text(
                        'Gender',
                        style: TextStyle(color: white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  const SizedBox(
                    width: 40,
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
                          stafcontroller.dob == null
                              ? const Text(
                                  "       DOB    ",
                                  style: TextStyle(color: Colors.grey),
                                )
                              : Text(
                                  DateFormat('   dd-MM-yy')
                                      .format(stafcontroller.dob!),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                          IconButton(
                            onPressed: () async {
                              await stafcontroller
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
                            value: stafcontroller.dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            style: const TextStyle(color: grey),
                            dropdownColor: bodygrey,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                stafcontroller.setDropdownValue(newValue);
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
                const Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                    right: 285,
                  ),
                  child: Text(
                    'Education',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: stafcontroller.educationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      contentPadding: const EdgeInsets.only(left: 30),
                      filled: true,
                      hintText: 'Education',
                      hintStyle: const TextStyle(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Education';
                      }
                      return null;
                    },
                    style: const TextStyle(color: grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 215,
                  ),
                  child: Text(
                    'Experience(In Year)',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: stafcontroller.experienceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      hintText: 'Experience',
                      contentPadding: const EdgeInsets.only(left: 30),
                      hintStyle: const TextStyle(color: grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Experience';
                      }
                      return null;
                    },
                    style: const TextStyle(color: grey),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 240,
                  ),
                  child: Text(
                    'Professional Bio',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: stafcontroller.bioController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: sideofboredr,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: bodygrey,
                      filled: true,
                      hintText: 'bio',
                      hintStyle: const TextStyle(color: grey),
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
                          if (stafcontroller.staffFormKey.currentState!
                              .validate()) {
                            stafcontroller.addStaffToFirebase(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: green,
                        ),
                        child: const Text(
                          "Add Staff",
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
