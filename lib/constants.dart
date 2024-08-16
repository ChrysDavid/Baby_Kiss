import 'package:flutter/material.dart';

import 'package:babikiss/size_config.dart';


double get screenWidth => SizeConfig.screenWidth;
double fem = screenWidth / 411;
double ffem = fem * 0.97;

const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

const kDisabledColor = Color(0xFF9E9E9E);
const kPrimaryColor = Color(0xFFDA548E);
const kBackgroudColor = Color.fromRGBO(255, 232, 224, 1);
const kPrimaryLightColor = Color(0xFFECA9C6);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFDA548E), Color.fromARGB(255, 222, 161, 187), ],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFFDA548E);

const kAnimationDuration = Duration(milliseconds: 200);
const kStorieDuration = Duration(seconds: 30);


// final headingStyle = TextStyle(...);: Cette ligne définit un style de texte pour les titres, en spécifiant la taille de la police, le poids, la couleur et la hauteur de ligne.
final headingStyle = TextStyle(
  //getProportionateScreenWidth : obtenir la proportion de la largeur de l'écran
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);


//final RegExp emailValidatorRegExp = ...;: Cette ligne définit une expression régulière pour valider les adresses e-mail. 
// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//Constantes de chaîne : Le code définit plusieurs constantes de chaîne utilisées pour les messages d'erreur affichés lors de la validation du formulaire (par exemple, "Veuillez entrer votre adresse e-mail").
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


//final otpInputDecoration = InputDecoration(...);: Cette ligne définit le style de décoration pour les champs de saisie OTP (One-Time Password), y compris le rembourrage du contenu, les bordures et les styles de bordure activés/focalisés.
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

//OutlineInputBorder outlineInputBorder() { ... }: Cette ligne définit une fonction nommée outlineInputBorder qui crée un objet OutlineInputBorder pour les bordures des champs de texte. Elle spécifie le rayon et la couleur de la bordure.
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}