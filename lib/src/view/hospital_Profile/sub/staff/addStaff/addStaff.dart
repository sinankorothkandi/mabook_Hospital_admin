import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class staff_add extends StatefulWidget {
  const staff_add({super.key});

  @override
  State<staff_add> createState() => _staff_addState();
}

class _staff_addState extends State<staff_add> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              color: white,
            )),
        centerTitle: true,
        title: const Text(
          'Add Staff',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 35,
                right: 285,
              ),
              child: Text(
                'Full Name',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'Name',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 289,
              ),
              child: Text(
                'Phone No',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'number',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 295,
              ),
              child: Text(
                'Category',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'Category',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Category';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, right: 110, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date Of Birth',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ],
              ),
            ),
            Row(children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                  color: bodygrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "     DOB    ",
                      style: TextStyle(color: grey),
                    ),
                    Icon(
                      Icons.calendar_month,
                      color: grey,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              Container(
                  height: 40,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: bodygrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        style: const TextStyle(color: grey),
                        dropdownColor: bodygrey,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        underline: null,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'One',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Two',
                            child: Text('FeMale'),
                          ),
                        ],
                      ),
                    ),
                  )),
            ]),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 215,
              ),
              child: Text(
                'Experience(In Year)',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'Experience',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Experience';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 285,
              ),
              child: Text(
                'Education',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'Education',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Education';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 240,
              ),
              child: Text(
                'Professional Bio',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'bio',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a bio';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 280,
              ),
              child: Text(
                'Languages ',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: sideofboredr,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'Language',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Language';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            Padding(
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
                      "Add Staff",
                      style: TextStyle(color: white, fontSize: 18),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
