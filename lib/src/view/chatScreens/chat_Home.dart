// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hospital_managment/src/view/const/colors.dart';

class chatHome extends StatelessWidget {
  const chatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: const Text(
          "   Message",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: white,
              ))
        ],
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.black,
                labelColor: white,
                unselectedLabelColor: white,
                indicatorColor: green,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    child: tabText(
                      'Patient',
                    ),
                  ),
                  Tab(
                    child: tabText('Doctor'),
                  ),
                  Tab(
                    child: tabText('Calls'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Tab 1: All Tasks
                    Column(
                      children: [
                        // Expanded(
                        //   child:
                        // ),
                      ],
                    ),
                    // Tab 2: Completed Tasks
                    Column(
                      children: [
                        // Expanded(
                        //   child:
                        // ),
                      ],
                    ),
                    // Tab 3: Completed Tasks
                    Column(
                      children: [
                        // Expanded(
                        //   child: ,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   Widget tabText(String data) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(data,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
