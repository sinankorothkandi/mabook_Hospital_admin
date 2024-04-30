// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/appointment/addAppointment/make_appointment.dart';
import 'package:hospital_managment/src/view/const/bottomNavebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class Appointment_List extends StatefulWidget {
  const Appointment_List({super.key});

  @override
  State<Appointment_List> createState() => _chatHomeState();
}

class _chatHomeState extends State<Appointment_List> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          title: const Text(
            "   Appointments",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MakeAppoinment()));
                },
                icon: const Icon(
                  Icons.post_add_sharp,
                  color: white,
                )),
          ],
        ),
        body: Center(
          child: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Column(
              children: [
                TabBar(
                  dividerColor: Colors.black,
                  labelColor: white,
                  unselectedLabelColor: white,
                  indicatorColor: green,
                  indicatorWeight: 4,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Compleated',
                      ),
                    ),
                    Tab(
                      child: Text('Upcoming'),
                    ),
                    Tab(
                      child: Text('Canceled'),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          // Expanded(
                          //   child:
                          // ),
                        ],
                      ),
                      // Tab 2: Completed Tasks
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('appoinments')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }

                              final appoinmentDocs = snapshot.data?.docs ?? [];

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: SizedBox(
                                  height: 580,
                                  width: 385,
                                  child: ListView.builder(
                                    itemCount: appoinmentDocs.length,
                                    itemBuilder: (context, index) {
                                      final doc = appoinmentDocs[index];
                                      final appoinmentData =
                                          doc.data() as Map<String, dynamic>;

                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 25,
                                        ),
                                        child: Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: bodygrey,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                height: 120,
                                                width: 230,
                                                // color: grey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "mr.${appoinmentData['name']}",
                                                      style: const TextStyle(
                                                          color: white,
                                                          fontSize: 28),
                                                    ),
                                                    Text(
                                                      'Department: ${appoinmentData.containsKey("department") ? appoinmentData["department"].toString() : "N/A"}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: grey,
                                                              fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 8,
                                                          backgroundColor:
                                                              orenge,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Pending',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: white,
                                                                  fontSize: 14),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  // Row(
                                                  //   children: [
                                                  //     Icon(Icons.calendar_month),
                                                  //     Text(
                                                  //       appoinmentData.containsKey("date")
                                                  //           ? appoinmentData["date"].toString()
                                                  //           : "N/A",
                                                  //       style: GoogleFonts.poppins(
                                                  //           color: grey, fontSize: 12),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  SizedBox(
                                                    height: 11,
                                                  ),
                                                  SizedBox(
                                                    height: 55,
                                                    width: 135,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'VIEW',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      // Tab 3: Completed Tasks
                      Column(
                        children: [
                          // Expanded(
                          //   child: ,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }));
  }
}


//