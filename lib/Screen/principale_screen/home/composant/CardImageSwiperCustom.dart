import 'package:babikiss/Screen/principale_screen/favorites/detaille_personne/detail_person_screen.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';

class CardImageSwiperCustom extends StatefulWidget {
  const CardImageSwiperCustom({
    super.key,
    required this.person,
  });

  final User person;

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
            builder: (context) => PageDetaillePersonne(
              personne: widget.person,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(widget.person.picture.large),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.person.name.last + "\n" + widget.person.name.first,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "${widget.person.dob.age} ans",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
