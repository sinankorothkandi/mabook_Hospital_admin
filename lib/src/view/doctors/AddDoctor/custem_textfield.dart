import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class CustomTextFiel extends StatelessWidget {
  final String hintText;
  final String titleText;
  final String validatorText;

  final TextEditingController controller;

  const CustomTextFiel({
    super.key,
    required this.hintText,
    required this.titleText,
    required this.controller,
    required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: GoogleFonts.poppins(fontSize: 17, color: white),
          ),
          const SizedBox(
            height: 3,
          ),
          TextFormField(
            style: const TextStyle(color: white),
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 30),
              hintText: hintText,
              fillColor: bodygrey,
              filled: true,
              hintStyle: GoogleFonts.poppins(
                color: grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: grey, width: 1),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $validatorText';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
