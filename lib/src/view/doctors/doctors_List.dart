// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/bottomNavebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/AddDoctor/select_Department.dart';

class doctor_List extends StatefulWidget {
  const doctor_List({super.key});

  @override
  State<doctor_List> createState() => _chatHomeState();
}

class _chatHomeState extends State<doctor_List> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          title: const Text(
            "   Doctors",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => select_deparment()));
                },
                icon: const Icon(
                  Icons.person_add_alt,
                  color: white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: white,
                ))
          ],
        ),
        body: Center(
            // child:,
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
