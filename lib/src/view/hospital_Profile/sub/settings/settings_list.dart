// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hospital_managment/src/view/const/bottomNavebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/staff/staff_List.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settings_list extends StatefulWidget {
  const settings_list({super.key});

  @override
  State<settings_list> createState() => _chatHomeState();
}

class _chatHomeState extends State<settings_list> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: black,
          title: Text(
            'Settings',
            style: TextStyle(color: white),
          ),
        ),
        backgroundColor: black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
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
                height: 520,
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => ));
                          },
                          leading: Icon(Icons.contact_page, color: white),
                          title: Text(
                            'Privacy Policy',
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
                          leading: Icon(Icons.info, color: white),
                          title: Text(
                            'App Info',
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
                                    builder: (_) => StaffList()));
                          },
                          leading: Icon(Icons.plagiarism_rounded, color: white),
                          title: Text(
                            'Terms & Conditions',
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
