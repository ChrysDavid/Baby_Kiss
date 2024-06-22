// Importations nécessaires
import 'package:babikiss/Screen/principale_screen/home/composant/CardImageSwiperCustom.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/models/data/list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:babikiss/size_config.dart'; // Importation de SizeConfig

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialiser SizeConfig
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(400), // Hauteur proportionnelle pour le Swiper
            child: CardSwiper(
              backCardOffset: Offset(0, -40),
              numberOfCardsDisplayed: 3, // Nombre de cartes affichées
              cardsCount: listUser.length,
              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => CardImageSwiperCustom(
                person: listUser[index],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20), // Hauteur proportionnelle
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconButton(Icons.close, Colors.red, 70),
              buildIconButton(Icons.favorite_border, Colors.white, 130, backgroundColor: kPrimaryColor),
              buildIconButton(Icons.star_border, Colors.green, 70),
            ],
          ),
        ],
      ),
    );
  }
}
