import 'package:babikiss/constants.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';

Widget customLocationIcon_1(User user){
  return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 3),
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage(
                  user.picture.large,
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
}