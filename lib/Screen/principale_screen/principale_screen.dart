import 'package:babikiss/Screen/principale_screen/Chats/chat_screen.dart';
import 'package:babikiss/Screen/principale_screen/favorites/favorite.dart';
import 'package:babikiss/Screen/principale_screen/home/home_page.dart';
import 'package:babikiss/Screen/principale_screen/profil/profil_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

  // bool _isSearching = false;
  // TextEditingController _searchController = TextEditingController();

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

    // AppBar appBarContent;

    // switch (_selectedIndex) {
    //   case 0:
    //     appBarContent = AppBar(
    //       automaticallyImplyLeading: false,
    //       title: const Text(
    //         "Discover",
    //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    //       ),
    //     );
    //     break;
    //   case 1:
    //     appBarContent = AppBar(
    //       title: Text(
    //         "Match",
    //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    //       ),
    //       automaticallyImplyLeading: false,
    //     );
    //     break;
    //   case 2:
    //     appBarContent = AppBar(
    //       title: _isSearching
    //           ? TextField(
    //               controller: _searchController,
    //               autofocus: true,
    //               decoration: InputDecoration(
    //                 hintText: 'Rechercher...',
    //                 border: InputBorder.none,
    //               ),
    //               onSubmitted: (value) {
    //                 setState(() {
    //                   _isSearching = false;
    //                 });
    //                 // Traitez le texte saisi ici
    //               },
    //             )
    //           : Text(
    //               "Message",
    //               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    //             ),
    //       automaticallyImplyLeading: false,
    //       actions: [
    //         _isSearching
    //             ? IconButton(
    //                 icon: Icon(Icons.close),
    //                 onPressed: () {
    //                   setState(() {
    //                     _isSearching = false;
    //                     _searchController.clear();
    //                   });
    //                 },
    //               )
    //             : IconButton(
    //                 icon: Icon(Icons.search),
    //                 onPressed: () {
    //                   setState(() {
    //                     _isSearching = true;
    //                   });
    //                 },
    //               ),
    //       ],
    //     );
    //     break;
    //   case 3:
    //     appBarContent = AppBar(
    //       title: Text(
    //         "Profil",
    //         style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    //       ),
    //       automaticallyImplyLeading: false,
    //     );
    //     break;
    //   default:
    //     appBarContent = AppBar(
    //       title: Text('Error'),
    //       automaticallyImplyLeading: false,
    //     );
    // }

    return Scaffold(
      // appBar: appBarContent,
      body: page[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: kSecondaryColor,
          items: const [
            Icon(
              Icons.home_outlined,
              color: kPrimaryColor,
              size: 35,
            ),
            Icon(
              Icons.favorite_outline,
              color: kPrimaryColor,
              size: 35,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: kPrimaryColor,
              size: 35,
            ),
            Icon(
              Icons.person_outlined,
              color: kPrimaryColor,
              size: 35,
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
