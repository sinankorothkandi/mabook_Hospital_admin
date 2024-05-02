import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/staff/addStaff/add_staff.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/staff/staff_details.dart';

class StaffList extends StatelessWidget {
  const StaffList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodygrey,
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(
          "Staff",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.navigate_before,
        //       color: white,
        //     )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => StaffAdd()));
              },
              icon: const Icon(
                Icons.person_add_alt_1_outlined,
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
        stream: FirebaseFirestore.instance.collection('staff').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final staffDocs = snapshot.data?.docs ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ListView.builder(
              itemCount: staffDocs.length,
              itemBuilder: (context, index) {
                final doc = staffDocs[index];
                final staffData = doc.data() as Map<String, dynamic>;

              
              final profilePath = staffData.containsKey('profile') && staffData['profile'] != null
        ? staffData['profile']
        : '';

                return ListTile(
                  leading: profilePath.isNotEmpty
                      ? CircleAvatar(
                          radius: 25,
                          backgroundColor: bodyblack,
                          backgroundImage: NetworkImage(profilePath),
                        )
                      : const CircleAvatar(
                          radius: 25,
                          backgroundColor: bodyblack,
                          child: Icon(
                            Icons.person,
                            color: grey,
                          )), 
                  title: Text(
                    staffData['name'],
                    style: const TextStyle(color: white),
                  ), 
                  subtitle: Text(
                    'Category: ${staffData.containsKey("category") ? staffData["category"].toString() : "N/A"}',
                    style: const TextStyle(color: grey),
                  ),
                  trailing: const Icon(
                    Icons.navigate_next,
                    color: white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StaffDetailPage(staffData: staffData),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
