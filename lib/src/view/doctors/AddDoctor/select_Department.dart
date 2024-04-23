import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_managment/src/controller/department_Controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:provider/provider.dart';

class select_deparment extends StatelessWidget {
  select_deparment({super.key});

  final TextEditingController depadmentController = TextEditingController();

  addDepatment() {
    FirebaseFirestore.instance.collection('departments').add({
      "Departmentname": depadmentController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Add Doctors",
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
            Consumer<departmentController>(
              builder: (context, departmentcontroller, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('departments')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          final departmentDocs = snapshot.data!.docs;
                          return Column(
                            children: departmentDocs.map((doc) {
                              final departmentData =
                                  doc.data() as Map<String, dynamic>;
                              final departmentName =
                                  departmentData['Departmentname'];
                              return Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  height: 50,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: bodygrey),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const FaIcon(
                                        FontAwesomeIcons.heartPulse,
                                        color: white,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        departmentName,
                                        style: const TextStyle(color: white),
                                      ),
                                    ],
                                  ),

                                  // You can add onTap function here if you want to handle taps on each department
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 300,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: bodygrey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, right: 200),
                                      child: Text(
                                        'Add Department',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 73, 46, 46),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 35, right: 190),
                                      child: Text(
                                        'Enter department name',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 10),
                                      child: TextFormField(
                                        controller: depadmentController,
                                        decoration: InputDecoration(
                                          hintText: 'Department Name',
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[900]!,
                                                width: 3),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a department';
                                          }
                                          return null;
                                        },
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (depadmentController
                                            .text.isNotEmpty) {
                                          addDepatment();
                                          depadmentController.clear();
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
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          minimumSize: const Size(0, 50),
                          backgroundColor: Colors.grey[900],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.add_circle_rounded,
                                color: Colors.white),
                            const SizedBox(width: 40),
                            Text(
                              'Add Department',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
