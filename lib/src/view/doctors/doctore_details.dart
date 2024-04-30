import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/doctor_information.dart';

class doctoreDetailPage extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  const doctoreDetailPage({super.key, required this.doctorData});

  @override
  Widget build(BuildContext context) {
    final profilePath =
        doctorData.containsKey('profile') && doctorData['profile'] != null
            ? doctorData['profile']
            : '';

    return Scaffold(
      backgroundColor: bodyblack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bodyblack,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(color: white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before, color: white)),
      ),
      body: Padding(
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
                        backgroundColor: bodygrey,
                        radius: 40,
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
                      'DR. ${doctorData['name'] ?? 'No Name'}',
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                    Text(
                      '${doctorData['department'] ?? 'No department'}',
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
            Text(
              'Details',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: bodygrey, borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                doctorInformation(doctorData: doctorData)));
                  },
                  leading: const Icon(
                    Icons.person_pin_outlined,
                    color: green,
                  ),
                  title: Text(
                    'Doctor Information',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: green,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 46),
            Text(
              'Appointments',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
