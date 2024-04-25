import 'dart:io';

class HospitalDetails {
  final int id;
  final int number;
  final String about;
  final String address;
  final List<int> time;
  final List<File> image;

  HospitalDetails(this.id,
      {required this.number,required this.about,required this.address,required this.time,required this.image});
}
