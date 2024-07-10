import 'package:babikiss/constants.dart';
import 'package:flutter/material.dart';
import 'package:babikiss/size_config.dart'; // Importation de SizeConfig

Widget boutonReseauxSociaux(IconData icon, {VoidCallback? fction}) {
  return TextButton(
    onPressed: fction ?? () {},
    child: Container(
      width: getProportionateScreenWidth(60), // Dynamically adjust the width
      height: getProportionateScreenHeight(60), // Dynamically adjust the height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kPrimaryLightColor,
          width: 2,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
          size: getProportionateScreenWidth(24), // Adjust icon size
        ),
      ),
    ),
  );
}

Widget nexBoutonPlein(BuildContext context, String text, Widget page) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      minimumSize: Size(
          getProportionateScreenWidth(320),
          getProportionateScreenHeight(
              50)), // Largeur et hauteur proportionnelles
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            12), // Vous pouvez ajuster le rayon pour obtenir les coins arrondis désirés
      ),
      side: BorderSide.none,
    ),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontSize: getProportionateScreenWidth(
              20)), // Taille proportionnelle du texte
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
  );
}

Widget nexBoutonVide(BuildContext context, String text, Widget page) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      minimumSize: Size(
          getProportionateScreenWidth(320),
          getProportionateScreenHeight(
              50)), // Largeur et hauteur proportionnelles
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            12), // Vous pouvez ajuster le rayon pour obtenir les coins arrondis désirés
      ),
      side: BorderSide(
        color: kPrimaryColor, // Couleur de la bordure
        width: 2, // Largeur de la bordure
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
          color: kPrimaryColor,
          fontSize: getProportionateScreenWidth(
              20)), // Taille proportionnelle du texte
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
  );
}

Widget buildIconButton(IconData icon, Color iconColor, double size,
    {Color backgroundColor = Colors.white, VoidCallback? fction}) {
  return TextButton(
    onPressed: fction ?? () {},
    child: Container(
      height: getProportionateScreenHeight(
          size), // Taille proportionnelle pour la hauteur
      width: getProportionateScreenWidth(
          size), // Taille proportionnelle pour la largeur
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100), // Coin arrondis
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5), // Position de l'ombre
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: size *
              0.4, // Ajuster la taille de l'icône en fonction de la taille du conteneur
        ),
      ),
    ),
  );
}

class CalendarBottomSheet extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;

  const CalendarBottomSheet({required this.onDateSelected, Key? key})
      : super(key: key);

  @override
  _CalendarBottomSheetState createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Expanded(
            child: CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              onDateChanged: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onDateSelected(selectedDate);
            },
            child: Text('Continuer'),
          ),
        ],
      ),
    );
  }
}

Widget separateur(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: kPrimaryLightColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        Expanded(
          child: Divider(
            color: kPrimaryLightColor,
            thickness: 1,
          ),
        ),
      ],
    ),
  );
}
