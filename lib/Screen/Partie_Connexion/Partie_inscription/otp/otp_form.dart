import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key, required this.pageController, 
  }) : super(key: key);

  final PageController pageController; // Ajouter cette ligne

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  // autofocus: true, // Supprimé pour éviter l'ouverture automatique du clavier
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kPrimaryColor, // Couleur de fond
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(15),),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => nextField(value, pin2FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  // autofocus: true, // Supprimé pour éviter l'ouverture automatique du clavier
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kPrimaryColor, // Couleur de fond
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(15),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  style: const TextStyle(fontSize: 24,color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  style: const TextStyle(fontSize: 24, color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                    }
                    // Scrolle vers la page suivante
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
