import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EcranSaisieNumero extends StatefulWidget {
  const EcranSaisieNumero(
      {super.key,
      required this.onPhoneNumberChanged,
      required this.pageController});

  final ValueChanged<String?> onPhoneNumberChanged;
  final PageController pageController; // Ajouter cette ligne

  @override
  State<EcranSaisieNumero> createState() => _EcranSaisieNumeroState();
}

class _EcranSaisieNumeroState extends State<EcranSaisieNumero> {
  String? _phoneNumber;
  late TextEditingController _phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
            child: Text("Suivant"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My mobile",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenHeight(20),
                0,
                getProportionateScreenHeight(30),
              ),
              child: Text(
                "Entrez un numéro de téléphone valide. Nous vous avons envoyé un code à 4 chiffres pour vérifier votre compte.",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              child: IntlPhoneField(
                controller:
                    _phoneController, // Utilise le contrôleur de texte pour conserver l'état
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryLightColor,
                    ),
                  ),
                ),
                initialCountryCode:
                    'CI', // Définit le code de pays initial à 'CI' (Côte d'Ivoire)
                onChanged: (phone) {
                  // Met à jour la variable _phoneNumber avec le numéro de téléphone complet
                  _phoneNumber = phone.completeNumber;
                  // Notifier le parent avec le numéro de téléphone
                  widget.onPhoneNumberChanged(_phoneNumber);
                  // Vérifie si _phoneNumber n'est pas null et si sa longueur est supérieure à 9 caractères
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
