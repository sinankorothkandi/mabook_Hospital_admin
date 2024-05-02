import 'package:flutter/material.dart';
import 'package:hospital_managment/src/controller/hospital_details_controller.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/hospital_Profile/hospitalDetailsAdding/w_hospital_details_adding.dart';

import 'package:provider/provider.dart';

class HospitalDetailsAdding extends StatelessWidget {
  const HospitalDetailsAdding({super.key});

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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.navigate_before,
                  color: green,
                  size: 33,
                )),
          ),
          body: SingleChildScrollView(
            child: Consumer<HospitalDetailsController>(
                builder: (BuildContext context, hdController, _) {
              return Form(
                key: hdController.hospitalDetailsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 60,
                      width: 220,
                      child: Image.asset('assets/image.png'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    imageAdding(hdController),
                    const SizedBox(
                      height: 30,
                    ),
                    detailsEnteringMethod(hdController),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 33),
                      child: Text(
                        'Time',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    timeAdding(hdController),
                    savingButton(hdController, context),
                  ],
                ),
              );
            }),
          )),
    );
  }

 
 
 
}
