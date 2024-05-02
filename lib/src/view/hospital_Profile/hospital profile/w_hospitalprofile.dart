import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:hospital_managment/src/view/doctors/department/department_select.dart';
import 'package:hospital_managment/src/view/homePage/patient_List/patients_List.dart';
import 'package:hospital_managment/src/view/hospital_Profile/hodpital%20details/hospital_details.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/settings/settings_list.dart';
import 'package:hospital_managment/src/view/hospital_Profile/sub/staff/staff_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

Container profileItems(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
        color: bodyblack,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    width: double.infinity,
    height: 580,
    child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23.0),
              ),
              color: bodygrey,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HospitalDetails()));
                },
                leading: const Icon(Icons.list_alt_rounded, color: white),
                title: Text(
                  'Hospital details',
                  style: GoogleFonts.poppins(
                    color: white,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(Icons.navigate_next, color: white),
              )),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            color: bodygrey,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SelectDepartment()));
              },
              leading: const Icon(Icons.person_add_sharp, color: white),
              title: const Text(
                'Add Doctore',
                style: TextStyle(color: white, fontSize: 20),
              ),
              trailing: const Icon(Icons.navigate_next, color: white),
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            color: bodygrey,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const StaffList()));
              },
              leading: const Icon(Icons.group, color: white),
              title: const Text(
                'Staff',
                style: TextStyle(color: white, fontSize: 20),
              ),
              trailing: const Icon(Icons.navigate_next, color: white),
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            color: bodygrey,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const patients_List()));
              },
              leading: const Icon(Icons.personal_injury_outlined, color: white),
              title: const Text(
                'patients',
                style: TextStyle(color: white, fontSize: 20),
              ),
              trailing: const Icon(Icons.navigate_next, color: white),
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            color: bodygrey,
            child: ListTile(
              onTap: () {
                //  Navigator.push(
                //       context, MaterialPageRoute
                //   (builder:(_)=> TermsandConditions() ));
              },
              leading: const Icon(Icons.history, color: white),
              title: const Text(
                'Payment History',
                style: TextStyle(color: white, fontSize: 20),
              ),
              trailing: const Icon(Icons.navigate_next, color: white),
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            color: bodygrey,
            child: ListTile(
              onTap: () {
                showSignOutDialog(context);
              },
              leading: const Icon(Icons.login_outlined, color: white),
              title: const Text(
                'Logout',
                style: TextStyle(color: white, fontSize: 20),
              ),
              trailing: const Icon(Icons.navigate_next, color: white),
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.0),
            ),
            color: bodygrey,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsList()));
              },
              leading: const Icon(Icons.settings, color: white),
              title: const Text(
                'Settings',
                style: TextStyle(color: white, fontSize: 20),
              ),
              trailing: const Icon(Icons.navigate_next, color: white),
            ),
          ),
        ),
      ],
    ),
  );
}

//====================================================================================

void showSignOutDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bodygrey,
        title: const Text(
          "sign out",
          style: TextStyle(color: white),
        ),
        content: const Text('Are You Sure You Want To Signout?',
            style: TextStyle(color: white)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No', style: TextStyle(color: white))),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                signOut(context);
              },
              child: const Text('Yes', style: TextStyle(color: white)))
        ],
      );
    },
  );
}

void signOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  // Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (context) => LoginPage()));
}
