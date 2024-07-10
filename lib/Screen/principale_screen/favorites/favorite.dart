import 'package:babikiss/Screen/principale_screen/favorites/detaille_personne/detail_person_screen.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/models/data/list_users.dart';
import 'package:babikiss/models/user.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<User> listFavorit = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialiser SizeConfig
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: 
      // listFavorit.isEmpty
      //     ? Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             SvgPicture.asset(
      //               "assets/illustrator/favorite_empty.svg",
      //               height: 350,
      //             ),
      //             SizedBox(
      //               height: getProportionateScreenHeight(10),
      //             ),
      //             Text("Aucun smatch pour le monment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), ),
      //           ],
      //         ),
      //       )
      //     : 
          SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    separateur("Today"),
                    SizedBox(
                      height: getProportionateScreenHeight(16),
                    ),
                    GridView.builder(
                      shrinkWrap:
                          true, // Important to avoid the ListView to take infinite height
                      physics:
                          NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return _customPersonSmach(context, users[index]);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (screenWidth > 600)
                            ? 4
                            : 2, // Adapting column count based on screen width
                        crossAxisSpacing: screenWidth * 0.03,
                        mainAxisSpacing: screenHeight * 0.03,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

Widget _customPersonSmach(BuildContext context, User person) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageDetaillePersonne(
            personne: person,
          ),
        ),
      );
    },
    child: Stack(
      children: [
        Container(
          height: screenHeight * 0.3,
          width: screenWidth * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(person.picture.large),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.015,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '${person.name.first}, ${person.dob.age}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.015,
                      fontWeight: FontWeight.bold,
                      wordSpacing: getProportionateScreenWidth(1),
                    ),
                    softWrap: true,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(getProportionateScreenWidth(50),
                        getProportionateScreenHeight(30)),
                    side: BorderSide(color: kPrimaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Suivre',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: screenHeight * 0.012,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
