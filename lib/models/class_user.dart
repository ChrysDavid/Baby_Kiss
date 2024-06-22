// import 'package:babikiss/models/class_message.dart';

class Personne {
  String profilPhoto;
  String nom;
  String prenom;
  int age;
  String metier;
  Location localisation;
  String genre;
  String orientationSexuelle;
  String bio;
  List<String> interets;
  List<String> galerie;

  Personne({
    required this.profilPhoto,
    required this.nom,
    required this.prenom,
    required this.metier,
    required this.age,
    required this.genre,
    required this.orientationSexuelle,
    required this.bio,
    required this.interets,
    required this.galerie,
    required this.localisation,
    // this.messages = const [],
  });
}

class Location {
  double longitude;
  double lagitude;

  Location({required this.lagitude, required this.longitude});
}
