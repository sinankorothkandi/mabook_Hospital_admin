  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

Column compleatedTabBarView() {
    return const Column(
                      children: [
                        // Expanded(
                        //   child:
                        // ),
                      ],
                    );
  }

//=============================================================================  


 Column UpcomingtabBarView() {
    return Column(
                      children: [
                        const SizedBox(
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
                                            const SizedBox(
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
                                                  const SizedBox(
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
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 8,
                                                        backgroundColor:
                                                            orenge,
                                                      ),
                                                      const SizedBox(
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
                                                const SizedBox(
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
                    );
  }

//==============================================================================================================================


Column canceledTabBarView() {
    return const Column(
                      children: [
                        // Expanded(
                        //   child: ,
                        // ),
                      ],
                    );
  }