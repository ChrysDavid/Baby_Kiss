
import 'package:babikiss/models/user_dob.dart';
import 'package:babikiss/models/user_location.dart';
import 'package:babikiss/models/user_name.dart';
import 'package:babikiss/models/user_picture.dart';

class User {
  final String gender;
  final UserName name;
  final UserLocation location;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserPicture picture;
  
  final UserDob dob;
  

  User({
    required this.email,
    required this.picture,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.gender,
    required this.name,
    required this.dob,
    required this.location,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final picture = UserPicture.fromMap(e['picture']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    return User(
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      picture: picture,
      gender: e['gender'],
      name: name,
      dob: dob,
      location: location,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
