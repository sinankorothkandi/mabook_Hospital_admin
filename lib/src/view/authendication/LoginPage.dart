// // ignore_for_file: prefer_const_constructors, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:hospital_managment/src/controller/LoginAuthenticationControl.dart';
// import 'package:provider/provider.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: SafeArea(
//       child: SingleChildScrollView(child: Consumer<LoginControll>(
//         builder: (context, loginControll, _) {
//           return Column(
//             children: [
//               SizedBox(
//                 height: 185,
//               ),
//               Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                             fontSize: 40,
//                             fontWeight: FontWeight.w800,
//                             fontFamily: 'Kanit'),
//                       ))),
//               Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Please sign in to adimin Panel',
//                       style: TextStyle(color: Colors.black54, fontSize: 19),
//                     ),
//                   )),
//               SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: TextFormField(
//                   controller: loginControll.usernameController,
//                   decoration: InputDecoration(
//                       labelText: 'Username',
//                       prefixIcon: Icon(Icons.person_outlined)),
//                 ),
//               ),
//               if (loginControll.userNameError.isNotEmpty)
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 80),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       loginControll.userNameError,
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: TextFormField(
//                   controller: loginControll.passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock_outlined),
//                   ),
//                   obscureText: true,
//                 ),
//               ),
//               if (loginControll.passwordErorr.isNotEmpty)
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 80),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       loginControll.passwordErorr,
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ),
//               SizedBox(
//                 height: 40,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 35),
//                 child: ElevatedButton(
//                   onPressed: loginControll.login(context),
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(135, 0, 0, 0),
//                       fixedSize: Size(320, 40),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8))),
//                   child: Text(
//                     'LOGIN',
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       )),
//     ));
//   }
// }
