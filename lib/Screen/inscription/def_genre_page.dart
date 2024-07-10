import 'package:babikiss/Screen/inscription/focus_screen.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/size_config.dart'; // Importation de SizeConfig
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  String? selectedGenre;

  void selectGenre(String genre) {
    setState(() {
      selectedGenre = genre;
    });
  }

  Widget buildGenreContainer(String genre) {
    bool isSelected = selectedGenre == genre;
    return GestureDetector(
      onTap: () => selectGenre(genre),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.white,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(15),
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            genre,
            style: TextStyle(
              color: isSelected ? Colors.white : kPrimaryColor,
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
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
                            builder: (context) => FocusScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "Je suis...",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  height: getProportionateScreenHeight(250),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/profile1.png",
                          height: getProportionateScreenHeight(160),
                        ),
                      ),
                      Positioned(
                        left: getProportionateScreenWidth(184),
                        top: getProportionateScreenHeight(125),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/icons/img/camera_icon.png",
                            height: getProportionateScreenHeight(160),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
                buildGenreContainer("Homme"),
                SizedBox(height: getProportionateScreenHeight(20)),
                buildGenreContainer("Femme"),
                SizedBox(height: getProportionateScreenHeight(20)),
                buildGenreContainer("Autre"),
                SizedBox(height: getProportionateScreenHeight(40)),
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
                        MaterialPageRoute(builder: (context) => FocusScreen()),
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
