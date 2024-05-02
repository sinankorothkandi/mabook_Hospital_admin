import 'package:flutter/material.dart';
import 'package:hospital_managment/src/controller/appoinment_controller.dart';
import 'package:hospital_managment/src/view/appointment/addAppointment/make_appointment_widgets.dart';
import 'package:hospital_managment/src/view/const/colors.dart';
import 'package:provider/provider.dart';

class MakeAppoinment extends StatelessWidget {
  const MakeAppoinment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyblack,
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
          'make an appointment',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppointmentController>(
            builder: (context, appointmentcontroller, _) {
              //make appointment form method 
          return makeAppointmentformWidget(appointmentcontroller, context);
        }),
      ),
    );
  }

 
}
