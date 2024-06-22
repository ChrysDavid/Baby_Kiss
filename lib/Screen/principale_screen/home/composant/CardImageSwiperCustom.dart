import 'package:babikiss/Screen/principale_screen/favorites/detaille_personne/detail_person_screen.dart';
import 'package:babikiss/models/class_user.dart';
import 'package:flutter/material.dart';

class CardImageSwiperCustom extends StatefulWidget {
  const CardImageSwiperCustom({
    super.key,
    required this.person,
  });

  final Personne person;

  @override
  State<CardImageSwiperCustom> createState() => _CardImageSwiperCustomState();
}

class _CardImageSwiperCustomState extends State<CardImageSwiperCustom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageDetaillePersonne(personne: widget.person,

            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.person.profilPhoto),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
