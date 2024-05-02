import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/hospital_Profile/hodpital%20details/hospital_details_widget.dart';
import 'package:hospital_managment/src/view/hospital_Profile/hospitalDetailsAdding/hospital_details_adding.dart';

class HospitalDetails extends StatelessWidget {
  const HospitalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hospital Details",
            style: GoogleFonts.poppins(fontSize: 18, color: white)),
        backgroundColor: black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              color: white,
              size: 29,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const HospitalDetailsAdding()));
              },
              icon: const Icon(
                Icons.edit,
                color: white,
              ))
        ],
      ),
      body: streamBuilder(),
    );
  }

  
}
