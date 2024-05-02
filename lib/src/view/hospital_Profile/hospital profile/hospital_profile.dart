import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/bottom_navebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/hospital_Profile/hospital%20profile/w_hospitalprofile.dart';

class HospitalProfile extends StatefulWidget {
  const HospitalProfile({super.key});

  @override
  State<HospitalProfile> createState() => _HospitalProfileState();
}

class _HospitalProfileState extends State<HospitalProfile> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 80,
                width: 350,
                child: Image.asset('assets/image.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              profileItems(context)
            ],
          ),
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
