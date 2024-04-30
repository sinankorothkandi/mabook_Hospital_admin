// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: black,
        title: Text(
          'App Info',
          style: GoogleFonts.poppins(color: white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before, color: white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150),
            child: SizedBox(
              height: 180,
              width: 420,
              child: Image.asset('assets/image.png'),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'vertion 1.0.0',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '@2022 MABOOK-HOSPITAL',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 44,
                  width: 177,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bodygrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Licenses',
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
