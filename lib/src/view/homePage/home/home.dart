import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/bottom_navebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/homePage/home/home_widgets.dart';

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
        appBar: HomeAppbar(context),
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
                patientCard(context),
                const SizedBox(
                  width: 10,
                ),
                genterCount()
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            DoctorCard(),
            const SizedBox(
              height: 40,
            ),
            staffCard(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }),
        floatingActionButton: floatingButton(context));
  }

 

 
 
}
