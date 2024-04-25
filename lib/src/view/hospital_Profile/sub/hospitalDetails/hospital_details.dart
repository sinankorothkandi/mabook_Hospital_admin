// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_managment/src/controller/hospital_details_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

import 'package:provider/provider.dart';

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
            child: Consumer<HospitalDetailsController>(
              builder: (BuildContext context, hdController,_) {  
              return Form(
                key: hdController.hospitalDetailsKey,
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
                        child: hdController.isImageSelected
                            ? SizedBox(
                                height: 170,
                                width: double.infinity,
                                child: CarouselSlider.builder(
                                  itemCount: hdController.imageFilelist.length,
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    return Stack(children: [
                                      Container(
                                        decoration:
                                            const BoxDecoration(color: Colors.grey),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Image.file(
                                            File(hdController.imageFilelist[index].path),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ]);
                                  },
                                  options: CarouselOptions(
                                    height: 170,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.8,
                                  ),
                                ),
                              )
                            :  GestureDetector(
                                onTap: () {
                                  hdController.selectImages();
                                },
                                child: Container(
                                  height: 150,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: bodygrey),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 90,
                                      ),
                                      Icon(
                                        Icons.add_a_photo,
                                        color: white,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'add Images',
                                        style:
                                            TextStyle(color: white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    SizedBox(
                      height: 30,
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
                          controller: hdController.numberController,
                          keyboardType: TextInputType.number,
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
                          controller: hdController.aboutController,
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
                        'Address',
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
                          controller: hdController.addressController,
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
              );}
            ),
          )),
    );
  }
}
