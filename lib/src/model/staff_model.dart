
class StaffModel {
  final int id;
  final String name;
  final int phoneNumber;
  final String category;
  final String education;
  final int experience;
  final String bio;
  final String dob;
  final bool gender;
  final String image;
  final String joiningdate;

  StaffModel(
    this.id,  {
    required this.image,
    required this.name,
    required this.phoneNumber,
    required this.category,
    required this.education,
    required this.experience,
    required this.bio,
    required this.dob,
    required this.gender,
    required this.joiningdate,
  });
}
