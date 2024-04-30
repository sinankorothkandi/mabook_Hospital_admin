class DoctorModel {
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
  final String specializein;
  final String consultancyfees;
  final String statemedicalcouncil;
  final String imrregisterno;

  DoctorModel(
    this.id, {
    required this.specializein,
    required this.consultancyfees,
    required this.statemedicalcouncil,
    required this.imrregisterno,
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
