import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/map/map_screen.dart';
import 'package:babikiss/models/user.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



  Widget buildAppBar(BuildContext context) {
    return Positioned(
      top: getProportionateScreenHeight(20),
      left: getProportionateScreenWidth(20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(
            getProportionateScreenWidth(50),
            getProportionateScreenHeight(50),
          ),
          side: BorderSide(color: Colors.white, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildBottomIcons() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconButton(
            Icons.close,
            Colors.red,
            70,
          ),
          buildIconButton(
            Icons.favorite_border,
            Colors.white,
            130,
            backgroundColor: kPrimaryColor,
          ),
          buildIconButton(
            Icons.star_border,
            Colors.green,
            70,
          ),
        ],
      ),
    );
  }

  Widget buildProfileInfo(User person) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    SizedBox(
                      width: screenWidth * 0.6, // Ajustez ce pourcentage selon vos besoins
                      child: Text(
                        "${person.fullName}, ${person.dob.age}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(25),
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                    ),
                    Text("Développeur Web"),
                  ],
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    side: BorderSide(color: kPrimaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Icon(FontAwesomeIcons.paperPlane, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLocation(BuildContext context, User person) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Localisation",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(23),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(person.location.city),
                  ],
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 196, 196, 196),
                    side: BorderSide.none,
                    shape: const RoundedRectangleBorder(),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MapScreen(user: person,),),);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "1 km",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBiography(User person) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Biographie",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(23),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30),),
                Text(
                  "djvnkcxokcwkcm; vdkmckmkwsmc dcokwlmdkmdwokcm dkcwkmckokomew okwdmckmcwkdc ",
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Lire",
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  

  Widget buildGallery() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Galerie",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(23),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30),),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: getProportionateScreenHeight(290),
                      width: getProportionateScreenWidth(162),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: getProportionateScreenHeight(290),
                      width: getProportionateScreenWidth(162),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(100),
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: getProportionateScreenHeight(180),
                          width: getProportionateScreenWidth(80),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }