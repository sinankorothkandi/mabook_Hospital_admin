// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:image_picker/image_picker.dart';

class hospital_details extends StatefulWidget {
  const hospital_details({super.key});

  @override
  State<hospital_details> createState() => _chatHomeState();
}

class _chatHomeState extends State<hospital_details> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: black,
            title: const Text(
              "Hospital Details",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: white),
            ),
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.navigate_before,
                  color: green,
                  size: 33,
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  width: 220,
                  child: Image.asset('assets/image.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Text(
                    'Location',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 33, vertical: 15),
                  child: Container(
                    height: 170,
                    width: 350,
                    decoration: BoxDecoration(
                      color: bodygrey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () {},
                    
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_location_alt_sharp,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Add Locatioin',
                            style: TextStyle(fontSize: 20, color: white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Text(
                    'Phone No',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: '+91 90...',
                          hintStyle: TextStyle(color: grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: bodygrey, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          )),
                      style: TextStyle(color: grey),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Text(
                    'About',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: 'Text here.....',
                          hintStyle: TextStyle(color: grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: bodygrey, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          )),
                      style: TextStyle(color: grey),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33),
                  child: Text(
                    'Time',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Tuesday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Wednesday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Thursday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Friday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Saturday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Sunday',
                              style: TextStyle(color: grey, fontSize: 18),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'from - to',
                                  hintStyle: TextStyle(color: grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: green,
                          ),
                          child: const Text(
                            "Add Details",
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
