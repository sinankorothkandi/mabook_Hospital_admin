import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hospital_managment/src/view/const/colors.dart';

class StaffDetailPage extends StatelessWidget {
  final Map<String, dynamic> staffData;

  const StaffDetailPage({super.key, required this.staffData});

  @override
  Widget build(BuildContext context) {
    final profilePath =
        staffData.containsKey('profile') && staffData['profile'] != null
            ? staffData['profile']
            : '';

    return Scaffold(
      backgroundColor: bodyblack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bodyblack,
        title: Text(
          staffData['name'] ?? 'Staff Details',
          style: const TextStyle(color: white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before, color: white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                profilePath.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(profilePath)),
                        radius: 40,
                      )
                    : const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person),
                      ),
                const SizedBox(width: 16),
                Text(
                  staffData['name'] ?? 'No Name',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Adding joining date
            Text(
              'Joining Date: ${staffData.containsKey("joiningdate") ? staffData["joiningdate"] : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'DOB: ${staffData.containsKey("dob") ? staffData["dob"] : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Phone: ${staffData.containsKey("phone_number") ? staffData["phone_number"].toString() : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${staffData.containsKey("category") ? staffData["category"] : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Education: ${staffData.containsKey("education") ? staffData["education"] : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Experience: ${staffData.containsKey("experience") ? staffData["experience"].toString() : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Bio: ${staffData.containsKey("bio") ? staffData["bio"] : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
