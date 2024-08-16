import 'package:babikiss/constants.dart';
import 'package:flutter/material.dart';

class TypeCart {
  String id;
  String nom;
  String image;
  TypeCart({required this.nom, required this.image, required this.id});
}

final List<TypeCart> list_TypeCart = [
    TypeCart(
        nom: "Par défaut",
        image: 'assets/images/img_cart_par_defaut.png',
        id: 'streets'),
    TypeCart(
        nom: "Satellite",
        image: 'assets/images/img_cart_satellite.png',
        id: 'satellite'),
  ];

Widget afficheTypeDeCart(String img, String nom, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
    child: Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: kPrimaryColor, width: 3)
                : Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(img),
            ),
          ),
        ),
        Text(
          nom,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: isSelected ? kPrimaryColor : Colors.black),
        ),
      ],
    ),
  );
}
