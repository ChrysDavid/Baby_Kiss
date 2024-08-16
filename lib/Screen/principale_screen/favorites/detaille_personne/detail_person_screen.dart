import 'package:babikiss/Screen/principale_screen/favorites/detaille_personne/composants.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';

class PageDetaillePersonne extends StatefulWidget {
  const PageDetaillePersonne({super.key, required this.personne, 

  });
  final User personne;

  @override
  State<PageDetaillePersonne> createState() => _PageDetaillePersonneState();
}

class _PageDetaillePersonneState extends State<PageDetaillePersonne> {
  String? selectedGenre;

  void selectGenre(String genre) {
    setState(() {
      selectedGenre = genre;
    });
  }

  List<String> centIntList = [
    "Musique",
    "Paiya",
    "Sport",
    "Dormir",
    "Réseaux Sociaux",
  ];

  Widget buildInterests() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Centres d’intérêts",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(23),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30),),
                GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Nombre de colonnes dans la grille
                    crossAxisSpacing: getProportionateScreenWidth(10),
                    childAspectRatio: getProportionateScreenWidth(2) /
                        getProportionateScreenHeight(1),
                    mainAxisSpacing: getProportionateScreenHeight(10),
                  ),
                  itemCount: centIntList.length,
                  itemBuilder: (context, index) {
                    return buildGenreContainer(centIntList[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGenreContainer(String genre) {
    bool isSelected = selectedGenre == genre;
    return GestureDetector(
      onTap: () => selectGenre(genre),
      child: Container(
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(120),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.white,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(15),
        ),
        child: Center(
          child: Text(
            genre,
            style: TextStyle(
              color: isSelected ? Colors.white : kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialiser SizeConfig

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(450),
              child: Stack(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(380),
                    width: double.infinity,
                    child: Image.network(
                      widget.personne.picture.large,
                      fit: BoxFit.cover,
                    ),
                  ),
                  buildAppBar(context),
                  buildBottomIcons(),
                ],
              ),
            ),
            buildProfileInfo(widget.personne),
            buildLocation(context, widget.personne),
            buildBiography(widget.personne),
            buildInterests(),
            buildGallery(),
          ],
        ),
      ),
    );
  }
}
