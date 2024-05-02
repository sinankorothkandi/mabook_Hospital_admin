import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/appointment/addAppointment/make_appointment.dart';
import 'package:hospital_managment/src/view/appointment/appoinment_display/appointment_display_widgets.dart';
import 'package:hospital_managment/src/view/const/bottom_navebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
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
                          builder: (_) => const MakeAppoinment()));
                },
                icon: const Icon(
                  Icons.post_add_sharp,
                  color: white,
                )),
          ],
        ),
        body: Center(
          child: DefaultTabController(
            length: 3,
            initialIndex: 1,
            child: Column(
              children: [
                TabBar(
                  dividerColor: Colors.black,
                  labelColor: white,
                  unselectedLabelColor: white,
                  indicatorColor: green,
                  indicatorWeight: 4,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 15,
                  ),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Compleated',
                      ),
                    ),
                    Tab(
                      child: Text('Upcoming'),
                    ),
                    Tab(
                      child: Text('Canceled'),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      //compleated tab bar view
                      compleatedTabBarView(),

                      // upcoming tab Bar View
                      UpcomingtabBarView(),

                      //canceledTabBarView
                      canceledTabBarView(),
                    ],
                  ),
                ),
              ],
            ),
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
