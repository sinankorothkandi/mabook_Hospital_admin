import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/controller/hospital_details_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

Padding timeAdding(HospitalDetailsController hdController) {
    return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Monday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Tuesday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Wednesday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Thursday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Friday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Saturday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Sunday",
                              style: GoogleFonts.poppins(
                                color: grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            ...List.generate(
                              7,
                              (index) => SizedBox(
                                height: 32,
                                width: 100,
                                child: TextFormField(
                                  controller:
                                      hdController.timeControllers[index],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "From - To",
                                    hintStyle: GoogleFonts.poppins(
                                      color: grey,
                                      fontSize: 15,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    color: grey,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
  }

  //===============================================================================


   Center savingButton(HospitalDetailsController hdController, BuildContext context) {
    return Center(
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (hdController
                                  .hospitalDetailsKey.currentState!
                                  .validate()) {
                                hdController
                                    .addOrUpdateHospitalDetails(context);
                              }
                            },
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
                  );
  }

  //==========================================================================================

   Padding imageAdding(HospitalDetailsController hdController) {
    return Padding(
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
                                      decoration: const BoxDecoration(
                                          color: Colors.grey),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Image.file(
                                          File(hdController
                                              .imageFilelist[index].path),
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
                          : GestureDetector(
                              onTap: () {
                                hdController.selectImages();
                              },
                              child: Container(
                                height: 150,
                                width: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: bodygrey),
                                child: const Row(
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
                                      style: TextStyle(
                                          color: white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ));
  }


//==============================================================================================

 Column detailsEnteringMethod(HospitalDetailsController hdController) {
    return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 33),
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
                                hintStyle: const TextStyle(color: grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: bodygrey, width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            style: const TextStyle(color: grey),
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 33),
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
                                hintStyle: const TextStyle(color: grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: bodygrey, width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            style: const TextStyle(color: grey),
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 33),
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
                                hintStyle: const TextStyle(color: grey),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: bodygrey, width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                )),
                            style: const TextStyle(color: grey),
                          )),
                    ],
                  );
  }
