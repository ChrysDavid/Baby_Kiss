import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/autres/bienvenu_babykiss.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/autres/page_info_utilisateur.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/autres/page_saisie_numero.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/page_info_personnel/page_info_personnel.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/otp/verification_otp.dart';
import 'package:flutter/material.dart';

class ListDePagePourInscription extends StatefulWidget {
  const ListDePagePourInscription({super.key});

  @override
  State<ListDePagePourInscription> createState() =>
      _ListDePagePourInscriptionState();
}

class _ListDePagePourInscriptionState extends State<ListDePagePourInscription>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  String? _phoneNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector permet de détecter les taps sur l'écran
    // Lorsque l'utilisateur tape en dehors des champs de texte, le clavier se ferme
    return GestureDetector(
      // Lorsqu'on tape sur l'écran, on retire le focus des champs de texte, ce qui cache le clavier
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          // onNotification est déclenché à chaque fois qu'un défilement se produit
          onNotification: (scrollNotification) {
            // Retire le focus des champs de texte pendant le défilement, ce qui ferme le clavier
            FocusScope.of(context).unfocus();
            return false; // Retourne false pour permettre à d'autres notifications d'être traitées
          },
          child: Stack(
            children: [
              PageView(
                physics:
                    NeverScrollableScrollPhysics(), // Empêche tout défilement manuel
                controller: pageController,
                children: [
                  EcranSaisieNumero(
                    pageController: pageController,
                    onPhoneNumberChanged: (phoneNumber) {
                      setState(() {
                        _phoneNumber = phoneNumber;
                      });
                      // Vous pouvez maintenant utiliser _phoneNumber ici ou passer cette valeur aux autres pages.
                    }, 
                  ),
                  VerificationOTP(
                    numberPhone: _phoneNumber,
                    pageController: pageController,
                  ),
                  PageEnregistrementInfosPersonnelles(pageController: pageController,),
                  PageEnregistrementInfoUtilisateur(pageController: pageController,),
                  PageBienvenu(pageController: pageController,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
