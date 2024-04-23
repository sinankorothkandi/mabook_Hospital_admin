import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hospital_managment/src/view/appointment/addAppointment/make_appointment.dart';
import 'package:hospital_managment/src/view/chatScreens/chat_Home.dart';
import 'package:hospital_managment/src/view/const/bottomNavebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/patient_List/patients_List.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          title: const Row(
            children: [
              Text(
                'MA',
                style: TextStyle(
                    color: white, fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Text(
                'B',
                style: TextStyle(
                    color: green, fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Text(
                'O',
                style: TextStyle(
                    color: white, fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Text(
                'OK',
                style: TextStyle(
                    color: green, fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset('assets/logo.png'),
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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: white,
                  size: 26,
                ))
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const patients_List()));
                  },
                  child: Container(
                    height: 165,
                    width: 240,
                    decoration: BoxDecoration(
                        color: bodygrey,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.assignment_ind_outlined,
                          size: 120,
                          color: green,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          'Total\nPatients\n   12057',
                          style: TextStyle(
                              color: white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 165,
                  width: 125,
                  decoration: BoxDecoration(
                      color: bodygrey, borderRadius: BorderRadius.circular(25)),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'MEN',
                        style: TextStyle(fontSize: 22, color: white),
                      ),
                      Text(
                        '1230',
                        style: TextStyle(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'WOMEN',
                        style: TextStyle(fontSize: 22, color: white),
                      ),
                      Text(
                        '1230',
                        style: TextStyle(
                            fontSize: 22,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 165,
              width: 380,
              decoration: BoxDecoration(
                  color: bodygrey, borderRadius: BorderRadius.circular(25)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.userDoctor,
                    size: 110,
                    color: green,
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    'Available\nDoctors\n     2057',
                    style: TextStyle(  
                        color: white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 165,
              width: 380,
              decoration: BoxDecoration(
                  color: bodygrey, borderRadius: BorderRadius.circular(25)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.groups_outlined,
                    size: 140,
                    color: green,
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    'Available\nStaff\n 257',
                    style: TextStyle(
                        color: white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }),
        floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 4, color: green),
                borderRadius: BorderRadius.circular(100)),
            elevation: 0.0,
            backgroundColor: green,
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const chatHome()));
            },
            child: const Icon(
              Icons.message,
              color: white,
            )));
  }
}
