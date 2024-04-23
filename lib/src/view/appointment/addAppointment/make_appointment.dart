import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class make_Appointment extends StatefulWidget {
  const make_Appointment({super.key});

  @override
  State<make_Appointment> createState() => _staff_addState();
}

class _staff_addState extends State<make_Appointment> {
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
          'Make an Appointment',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 35,
                right: 258,
              ),
              child: Text(
                'Patient name',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: bodygrey, width: 0),
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
                    borderSide: const BorderSide(color: bodygrey, width: 0),
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
                    borderSide: const BorderSide(color: bodygrey, width: 0),
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
              padding: EdgeInsets.only(
                top: 20,
                right: 310,
              ),
              child: Text(
                'Doctor',
                style: TextStyle(color: white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextFormField(
                // controller: depadmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: bodygrey, width: 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'enter doctor',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a doctor name';
                  }
                  return null;
                },
                style: const TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 299,
              ),
              child: Text(
                'Address',
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
                    borderSide: const BorderSide(color: bodygrey, width: 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: bodygrey,
                  filled: true,
                  hintText: 'type address here',
                  hintStyle: const TextStyle(color: grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a address';
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
                      "Confirm appointment",
                      style: TextStyle(color: white, fontSize: 15),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
