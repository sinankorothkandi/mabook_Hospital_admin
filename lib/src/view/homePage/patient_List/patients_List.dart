// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class patients_List extends StatefulWidget {
  const patients_List({super.key});

  @override
  State<patients_List> createState() => _chatHomeState();
}

class _chatHomeState extends State<patients_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          title: const Text(
            "   Patients",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: white),
          ),
          actions: [
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
            ));
  }
}
