
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_managment/src/view/appointment/appoinment_display/appointment.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/doctorDislay/doctors_list.dart';
import 'package:hospital_managment/src/view/homePage/home/home.dart';
import 'package:hospital_managment/src/view/hospital_Profile/hospital%20profile/hospital_profile.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: black,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: white,
          unselectedItemColor: grey,
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const doctor_List(),
                ),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppointmentList()),
              );
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HospitalProfile()),
              );
            }
            //else {
            //   onTap(index);
            // }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userDoctor, size: 28),
              label: 'Doctor',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.tableList, size: 28),
              label: 'appointment',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.hospitalUser, size: 28),
              label: 'profile',
            ),
          ],
        ),
      ],
    );
  }
}
