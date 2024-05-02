import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/bottom_navebar.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/department/department_select.dart';
import 'package:hospital_managment/src/view/doctors/doctorDislay/doctore_details.dart';

class doctor_List extends StatefulWidget {
  const doctor_List({super.key});

  @override
  State<doctor_List> createState() => _chatHomeState();
}

class _chatHomeState extends State<doctor_List> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          title: const Text(
            "   Doctors",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SelectDepartment()));
                },
                icon: const Icon(
                  Icons.person_add_alt,
                  color: white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: white,
                ))
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('doctoreCollection')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final doctorDocs = snapshot.data?.docs ?? [];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.builder(
                itemCount: doctorDocs.length,
                itemBuilder: (context, index) {
                  final doc = doctorDocs[index];
                  final doctorData = doc.data() as Map<String, dynamic>;

                 
              final profilePath = doctorData.containsKey('profile') && doctorData['profile'] != null
        ? doctorData['profile']
        : '';

                  return ListTile(
                    leading: profilePath.isNotEmpty
                        ?  CircleAvatar(
                          radius: 25,
                          backgroundColor: bodyblack,
                          backgroundImage: NetworkImage(profilePath),
                        )
                        : const CircleAvatar(
                            backgroundColor: bodygrey,
                            radius: 25,
                            child: Icon(
                              Icons.person,
                              color: grey,
                            )),
                    title: Text(
                      doctorData['name'],
                      style: const TextStyle(color: white),
                    ),
                    subtitle: Text(
                      ' ${doctorData.containsKey("department") ? doctorData["department"].toString() : "N/A"}',
                      style: const TextStyle(color: grey),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: white,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctoreDetailPage(doctorData: doctorData),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
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
