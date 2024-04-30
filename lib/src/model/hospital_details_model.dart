import 'dart:io';

class HospitalDetails {
  final int id;
  final int number;
  final String about;
  final String address;
  final List<String> time;
  final List<File> image;
   bool isdetailsAdded = false;

  HospitalDetails(this.id,
      {required this.number,
      required this.about,
      required this.address,
      required this.time,
      required this.image,
     });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'about': about,
      'address': address,
      'time': time,

      'images': image.map((file) => file.path).toList(),
    };
  }
}
