import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class select_deparment extends StatelessWidget {
  const select_deparment({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Department"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('departments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final departmentDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: departmentDocs.length,
            itemBuilder: (context, index) {
              final departmentData =
                  departmentDocs[index].data() as Map<String, dynamic>;
              final departmentName = departmentData['Departmentname'];
              return ListTile(
                title: Text(departmentName),
              );
            },
          );
        },
      ),
    );
  }
}
