
// import 'package:flutter/material.dart';
// import 'package:hospital_managment/src/view/homePage/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginControll extends ChangeNotifier {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   String userNameError = '';
//   String passwordErorr = '';

//   login(BuildContext context) {
//     String username = usernameController.text;
//     String password = passwordController.text;

//     userNameError = '';
//     passwordErorr = '';

//     if (username != "MaBook") {
//       userNameError = "Invalid Username";
//     }
//     if (password != "12345") {
//       passwordErorr = "Invalid Password";
//     }
//     if (username.isEmpty) {
//       userNameError = "Enter Username";
//     }
//     if (password.isEmpty) {
//       passwordErorr = "Enter Password";
//     }
//     if (userNameError.isEmpty && userNameError.isEmpty) {
//       setLoggedIn();
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => const HomePage()));
//     } else {
//             setState(() {});

//     }
    // notifyListeners();

//   }

//   void setLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool("isLoggedIn", true);
//   }
// }
