 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_managment/src/controller/department_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/AddDoctor/adddoctor/Add_doctor.dart';

StreamBuilder<QuerySnapshot<Object?>> departmentRetriving() {
    return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('departments')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final departmentDocs = snapshot.data!.docs;
              return Column(
                children: departmentDocs.map((doc) {
                  final departmentData = doc.data() as Map<String, dynamic>;
                  final departmentName = departmentData['Departmentname'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DoctorAdd(
                                      departments: departmentName,
                                    )));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: bodygrey),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.heartPulse,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              departmentName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          );
  }


   Future<dynamic> showModelBottemSheet(BuildContext context, DepartmentController departmentController, TextEditingController departmentNameController) {
    return showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: bodyblack,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20, right: 200),
                            child: Text(
                              'Add Department',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.only(top: 35, right: 190),
                            child: Text(
                              'Enter Department Name',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: TextFormField(
                              controller: departmentNameController,
                              decoration: InputDecoration(
                                hintText: 'Department Name',
                                hintStyle:
                                    const TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[900]!),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a department name';
                                }
                                return null;
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (departmentNameController.text.isNotEmpty) {
                                departmentController.addDepartment(
                                    departmentNameController.text);
                                departmentNameController.clear();
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
  }
