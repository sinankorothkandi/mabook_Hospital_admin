
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/doctorDislay/doctorInformation/doctor_information_widget.dart';

class DoctorInformation extends StatelessWidget {
  final Map<String, dynamic> doctorData;
  const DoctorInformation({super.key, required this.doctorData});

  @override
  Widget build(BuildContext context) {
    final profilePath = doctorData.containsKey('profile') && doctorData['profile'] != null
        ? doctorData['profile']
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              color: white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              profileSection(profilePath,doctorData),
              const SizedBox(height: 46),
              detailsDisplay(doctorData),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: editbutton()),
            ],
          ),
        ),
      ),
    );
  }



  
}
