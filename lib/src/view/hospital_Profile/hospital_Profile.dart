// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/authendication/LoginPage.dart';
import 'package:hospital_managment/src/view/const/bottomNavebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/AddDoctor/select_Department.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/hospital_details.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/settings/settings_list.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/staff/staff_List.dart';
import 'package:hospital_managment/src/view/patient_List/patients_List.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hospital_Profile extends StatefulWidget {
  const hospital_Profile({super.key});

  @override
  State<hospital_Profile> createState() => _chatHomeState();
}

class _chatHomeState extends State<hospital_Profile> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 80,
                width: 350,
                child: Image.asset('assets/image.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: bodygrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                width: double.infinity,
                height: 580,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => hospital_details()));
                          },
                          leading: Icon(Icons.list_alt_rounded, color: white),
                          title: Text(
                            'Hospital details',
                            style: GoogleFonts.poppins(color: white, fontSize: 20,),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                    SizedBox(       
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                             Navigator.push(
                                  context, MaterialPageRoute
                              (builder:(_)=> select_deparment() ));
                          },
                          leading: Icon(Icons.person_add_sharp, color: white),
                          title: Text(
                            'Add Doctore',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => staff_List()));
                          },
                          leading: Icon(Icons.group, color: white),
                          title: Text(
                            'Staff',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                             Navigator.push(
                                  context, MaterialPageRoute
                              (builder:(_)=> patients_List() ));
                          },
                          leading: Icon(Icons.personal_injury_outlined,
                              color: white),
                          title: Text(
                            'patients',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                            //  Navigator.push(
                            //       context, MaterialPageRoute
                            //   (builder:(_)=> TermsandConditions() ));
                          },
                          leading: Icon(Icons.history, color: white),
                          title: Text(
                            'Payment History',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                            showSignOutDialog(context);
                          },
                          leading: Icon(Icons.login_outlined, color: white),
                          title: Text(
                            'Logout',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        color: itemgrey,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => settings_list()));
                          },
                          leading: Icon(Icons.settings, color: white),
                          title: Text(
                            'Settings',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          trailing: Icon(Icons.navigate_next, color: white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
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

  void showSignOutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bodygrey,
          title: Text(
            "sign out",
            style: TextStyle(color: white),
          ),
          content: Text('Are You Sure You Want To Signout?',
              style: TextStyle(color: white)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No', style: TextStyle(color: white))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  signOut(context);
                },
                child: Text('Yes', style: TextStyle(color: white)))
          ],
        );
      },
    );
  }

  void signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
