import 'package:babikiss/Screen/principale_screen/Chats/chat_screen.dart';
import 'package:babikiss/Screen/principale_screen/favorites/favorite.dart';
import 'package:babikiss/Screen/principale_screen/home/home_page.dart';
import 'package:babikiss/Screen/principale_screen/profil/profil_page.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart'; // Importation de SizeConfig
import 'package:flutter/material.dart';

class PrincipaleScreen extends StatefulWidget {
  const PrincipaleScreen({super.key});

  @override
  State<PrincipaleScreen> createState() => _PrincipaleScreenState();
}

class _PrincipaleScreenState extends State<PrincipaleScreen> {
  int _selectedIndex = 0;

  var page = [
    HomePage(),
    FavoritePage(),
    ChatScreen(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialiser SizeConfig

    AppBar appBarContent;

    double iconSize = getProportionateScreenWidth(60); // Utiliser SizeConfig pour la taille des icônes
    double padding = getProportionateScreenWidth(5); // Utiliser SizeConfig pour les paddings

    switch (_selectedIndex) {
      case 0:
        appBarContent = AppBar(
          centerTitle: true,
          title: const Text(
            "Discover",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          leading: Container(
            width: iconSize, // Définir la largeur de la boîte
            height: iconSize, // Définir la hauteur de la boîte
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: kPrimaryLightColor, // Couleur de la bordure
                width: 2, // Épaisseur de la bordure
              ),
              shape: BoxShape.rectangle, // Forme de la boîte
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Image.asset("assets/icons/img/waffle-removebg-preview.png"),
              ),
            ),
          ),
          actions: [
            Container(
              width: iconSize, // Définir la largeur de la boîte
              height: iconSize, // Définir la hauteur de la boîte
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kPrimaryLightColor, // Couleur de la bordure
                  width: 2, // Épaisseur de la bordure
                ),
                shape: BoxShape.rectangle, // Forme de la boîte
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Image.asset("assets/icons/img/controle-du-son.png"),
                ),
              ),
            ),
          ],
        );
        break;
      case 1:
        appBarContent = AppBar(
          title: Text(
            "Match",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Container(
              width: iconSize, // Définir la largeur de la boîte
              height: iconSize, // Définir la hauteur de la boîte
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kPrimaryLightColor, // Couleur de la bordure
                  width: 2, // Épaisseur de la bordure
                ),
                shape: BoxShape.rectangle, // Forme de la boîte
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Image.asset("assets/icons/img/controle-du-son.png"),
                ),
              ),
            ),
          ],
        );
        break;
      case 2:
        appBarContent = AppBar(
          title: Text(
            "Message",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Container(
              width: iconSize, // Définir la largeur de la boîte
              height: iconSize, // Définir la hauteur de la boîte
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kPrimaryLightColor, // Couleur de la bordure
                  width: 2, // Épaisseur de la bordure
                ),
                shape: BoxShape.rectangle, // Forme de la boîte
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Image.asset("assets/icons/img/controle-du-son.png"),
                ),
              ),
            ),
          ],
        );
        break;
      case 3:
        appBarContent = AppBar(
          title: Text(
            "Profil",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        );
        break;
      default:
        appBarContent = AppBar(
          title: Text('Error'),
          automaticallyImplyLeading: false,
        );
    }

    return Scaffold(
      appBar: appBarContent,
      body: page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap:(index) {
    setState(() {
      _selectedIndex = index;
    });}
      ),
    );
  }
}
