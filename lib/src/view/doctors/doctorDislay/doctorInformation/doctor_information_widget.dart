import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

Row profileSection(profilePath, Map<String, dynamic> doctorData) {
  return Row(
    children: [
      profilePath.isNotEmpty
          ? CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(profilePath),
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
  );
}

//=====================================================================================

Column detailsDisplay(Map<String, dynamic> doctorData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            'Joining Date: ${doctorData.containsKey("joiningdate") ? doctorData["joiningdate"] : "N/A"}',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: grey,
            ),
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
        '${doctorData.containsKey("education") ? doctorData["education"] : "N/A"}',
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
        doctorData.containsKey("phone_number")
            ? doctorData["phone_number"].toString()
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
                doctorData.containsKey("gender")
                    ? doctorData["gender"].toString()
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
                doctorData.containsKey("dob")
                    ? doctorData["dob"].toString()
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
        "${doctorData.containsKey("experience") ? doctorData["experience"].toString() : "N/A"} years",
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: grey,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'IMR Register No',
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        doctorData.containsKey("imrregisterno")
            ? doctorData["imrregisterno"].toString()
            : "N/A",
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: grey,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'specialize in',
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        doctorData.containsKey("specializein")
            ? doctorData["specializein"].toString()
            : "N/A",
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: grey,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'Consultancy Fees',
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        doctorData.containsKey("consultancyfees")
            ? doctorData["consultancyfees"].toString()
            : "N/A",
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: grey,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        'State Medical Council',
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        doctorData.containsKey("statemedicalcouncil")
            ? doctorData["statemedicalcouncil"].toString()
            : "N/A",
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
        '${doctorData.containsKey("bio") ? doctorData["bio"] : "N/A"}',
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: grey,
        ),
      ),
    ],
  );
}

//===================================================================================

SizedBox editbutton() {
  return SizedBox(
    width: 350,
    height: 50,
    child: ElevatedButton(
      onPressed: () {
        // if (stafcontroller.staffFormKey.currentState!
        //     .validate()) {
        //   stafcontroller.addStaffToFirebase(context);
        // }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: green,
      ),
      child: const Text(
        "Edit",
        style: TextStyle(color: white, fontSize: 18),
      ),
    ),
  );
}
