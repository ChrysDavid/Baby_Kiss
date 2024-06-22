import 'package:babikiss/models/class_user.dart';

// Exemple de liste d'utilisateurs
List<Personne> listUser = [
  Personne(
    profilPhoto: "assets/images/Personnes/psonne.png",
    nom: "Alo",
    prenom: "Kouassi Bernar",
    metier: "Chanteur",
    age: 35,
    genre: "Homme",
    orientationSexuelle: "Hetero",
    bio: "Cette solution permet à l'utilisateur de sélectionner un maximum de 3 centres d'intérêt. Les éléments sélectionnés sont mis en évidence avec une bordure et un fond verts.",
    interets: ["Jeux", "Musique", "Peche"],
    galerie: ["assets/images/Personnes/p2.png", "assets/images/Personnes/p.png", "assets/images/Personnes/p.png"],
    localisation: Location(lagitude: 225.645, longitude: 324.057),
  ),
  Personne(
    profilPhoto: "assets/images/Personnes/p3.png",
    nom: "Brou",
    prenom: "Chrys David",
    metier: "Developpeur",
    age: 30,
    genre: "Homme",
    orientationSexuelle: "Hetero",
    bio: "Cette solution permet à l'utilisateur de sélectionner un maximum de 3 centres d'intérêt. Les éléments sélectionnés sont mis en évidence avec une bordure et un fond verts.",
    interets: ["Jeux", "Musique", "Sport"],
    galerie: ["assets/images/Personnes/p3.png", "assets/images/Personnes/p4.png", "assets/images/Personnes/p4.png"],
    localisation: Location(lagitude: 225.645, longitude: 324.057),
  ),
  Personne(
    profilPhoto: "assets/images/Personnes/p5.png",
    nom: "Kossonou",
    prenom: "Marie Joseph",
    metier: "Inteligence Artificiel",
    age: 26,
    genre: "Femme",
    orientationSexuelle: "Hetero",
    bio: "Cette solution permet à l'utilisateur de sélectionner un maximum de 3 centres d'intérêt. Les éléments sélectionnés sont mis en évidence avec une bordure et un fond verts.",
    interets: ["Jeux", "Musique", "Sport"],
    galerie: ["assets/images/Personnes/p6.png", "assets/images/Personnes/p6.png", "assets/images/Personnes/p5.png"],
    localisation: Location(lagitude: 225.645, longitude: 324.057),
  ),
];

