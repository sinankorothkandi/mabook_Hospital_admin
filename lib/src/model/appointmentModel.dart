class AppointmentModel {
  final int id;
  final String name;
  final int phoneNumber;
  final String department;
  final String dob;
  final bool gender;
  final String date;
  final String doctor;
  final String address;

  AppointmentModel(
    this.id, {
    required this.department,
    required this.date,
    required this.doctor,
    required this.address,
    required this.name,
    required this.phoneNumber,
    required this.dob,
    required this.gender,
  });

  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'department': department,
      'dob': dob,
      'gender': gender ? 'Male' : 'Female', 
      'date': date,
      'doctor': doctor,
      'address': address, 
    };
  }
}
