import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment/firebase_options.dart';
import 'package:hospital_managment/src/controller/department_Controller.dart';
import 'package:hospital_managment/src/controller/hospital_details_controller.dart';
import 'package:hospital_managment/src/controller/staff_controller.dart';
import 'package:hospital_managment/src/view/splashScreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void>main()async {
  runApp(const MainApp());
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// .then((FirebaseApp value) => Get.put(AuthenticationRepository()))
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DepartmentController()),
        ChangeNotifierProvider(create: (context) => HospitalDetailsController()),
                ChangeNotifierProvider(create: (context) => Staffcontroller())

      ],
      child: const MaterialApp(
        home: mysplashScreen(),
      ),
    );
  }
}
