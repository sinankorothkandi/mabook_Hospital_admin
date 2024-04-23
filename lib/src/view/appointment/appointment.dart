// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
                          builder: (_) => const make_Appointment()));
                },
                icon: const Icon(
                  Icons.post_add_sharp,
                  color: white,
                )),
            
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
