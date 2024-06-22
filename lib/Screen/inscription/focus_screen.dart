import 'package:babikiss/Screen/principale_screen/principale_screen.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/size_config.dart'; // Importation de SizeConfig
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  List<Intereticon> listeIntereticon = [
    Intereticon(icon: Icons.photo_camera, text: "Photo"),
    Intereticon(icon: Icons.local_hotel, text: "Dormir"),
    Intereticon(icon: Icons.color_lens, text: "Art"),
    Intereticon(icon: Icons.flight_rounded, text: "Voyage"),
    Intereticon(icon: Icons.mic_external_on_outlined, text: "Musique"),
    Intereticon(icon: Icons.kayaking_outlined, text: "Natation"),
    Intereticon(icon: Icons.keyboard_voice_outlined, text: "Karaoké"),
    Intereticon(icon: Icons.lunch_dining, text: "Cuisine"),
    Intereticon(icon: Icons.library_books, text: "Lecture"),
    Intereticon(icon: Icons.nightlife_sharp, text: "Paiya"),
    Intereticon(icon: Icons.local_mall, text: "Shopping"),
    Intereticon(icon: Icons.local_movies, text: "Film"),
    Intereticon(icon: Icons.mobile_friendly, text: "Réseaux sociaux"),
    Intereticon(icon: Icons.games, text: "Jeux Vidéos"),
  ];

  List<Intereticon> selectedInterets = [];

  void toggleSelection(Intereticon interet) {
    setState(() {
      if (selectedInterets.contains(interet)) {
        selectedInterets.remove(interet);
      } else if (selectedInterets.length < 3) {
        selectedInterets.add(interet);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(
        context); // Initialiser SizeConfig pour récupérer les dimensions de l'écran
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    boutonReseauxSociaux(FontAwesomeIcons.angleDoubleLeft,
                        fction: () {
                      Navigator.pop(context);
                    }),
                    boutonReseauxSociaux(
                      FontAwesomeIcons.angleDoubleRight,
                      fction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrincipaleScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "Centres d’intérêts",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(13)),
                  child: Text(
                    "Sélectionnez les éléments qui correspondent à votre personnalité",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Nombre de colonnes dans la grille
                      crossAxisSpacing: getProportionateScreenWidth(
                          10.0), // Espacement horizontal entre les éléments
                      mainAxisSpacing: getProportionateScreenHeight(
                          10.0), // Espacement vertical entre les éléments
                      childAspectRatio:
                          3, // Ratio de l'aspect des enfants (largeur / hauteur)
                    ),
                    itemCount: listeIntereticon.length, // Nombre d'éléments dans la grille
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final interet = listeIntereticon[index];
                      final isSelected = selectedInterets.contains(interet);
                      return GestureDetector(
                        onTap: () => toggleSelection(interet),
                        child: buildFocusWidget(interet.icon, interet.text, isSelected),
                      );
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(80)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: Size(
                          double.infinity, getProportionateScreenHeight(60)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide.none,
                    ),
                    child: Text(
                      "Continuer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(20)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrincipaleScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Intereticon {
  String text;
  IconData icon;
  Intereticon({required this.icon, required this.text});
}

Widget buildFocusWidget(IconData icon, String text, bool isSelected) {
  return Container(
    height: getProportionateScreenHeight(50),
    width: getProportionateScreenWidth(170),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: isSelected ? Colors.white : kPrimaryColor,
        width: 2,
      ),
      color: isSelected ? kPrimaryColor : Colors.transparent,
    ),
    child: Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : kPrimaryColor,
            size: getProportionateScreenWidth(20),
          ),
          SizedBox(width: getProportionateScreenWidth(4)),
          Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : kPrimaryColor,
                fontSize: getProportionateScreenWidth(13)),
          ),
        ],
      ),
    ),
  );
}