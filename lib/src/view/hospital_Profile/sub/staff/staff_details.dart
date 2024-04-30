import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class StaffDetailPage extends StatelessWidget {
  final Map<String, dynamic> staffData;
  const StaffDetailPage({super.key, required this.staffData});

  @override
  Widget build(BuildContext context) {
    final profilePath =
        staffData.containsKey('profile') && staffData['profile'] != null
            ? staffData['profile']
            : '';
    return Scaffold(
      backgroundColor: bodyblack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bodyblack,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: white,
          ),
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.navigate_before,
        //       color: white,
        //     )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Row(
                children: [
                  profilePath.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: bodygrey,
                          backgroundImage: FileImage(File(profilePath)),
                          radius: 40,
                        )
                      : const CircleAvatar(
                          radius: 40,
                          backgroundColor: bodygrey,
                          child: Icon(
                            Icons.person,
                            color: grey,
                          ),
                        ),
                  const SizedBox(width: 26),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${staffData['name'] ?? 'No Name'}',
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                      Text(
                        '${staffData['category'] ?? 'No category'}',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 46),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Joinde Date: ${staffData.containsKey("joiningdate") ? staffData["joiningdate"] : "N/A"}',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: grey,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Education',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${staffData.containsKey("education") ? staffData["education"] : "N/A"}',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Phone',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                staffData.containsKey("phone_number")
                    ? staffData["phone_number"].toString()
                    : "N/A",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Genter',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        staffData.containsKey("gender")
                            ? staffData["gender"].toString()
                            : "N/A",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Column(
                    children: [
                      Text(
                        'Date Of Birth',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        staffData.containsKey("dob")
                            ? staffData["dob"].toString()
                            : "N/A",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'experience',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${staffData.containsKey("experience") ? staffData["experience"].toString() : "N/A"} years",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Professional Bio',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${staffData.containsKey("bio") ? staffData["bio"] : "N/A"}',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              // Padding(
              //     padding: const EdgeInsets.only(
              //       top: 20,
              //     ),
              //     child: SizedBox(
              //       width: 350,
              //       height: 50,
              //       child: ElevatedButton(
              //         onPressed: () {
              //           // if (stafcontroller.staffFormKey.currentState!
              //           //     .validate()) {
              //           //   stafcontroller.addStaffToFirebase(context);
              //           // }
              //         },
              //         style: ElevatedButton.styleFrom(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(15)),
              //           backgroundColor: green,
              //         ),
              //         child: const Text(
              //           "Edit",
              //           style: TextStyle(color: white, fontSize: 18),
              //         ),
              //       ),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
