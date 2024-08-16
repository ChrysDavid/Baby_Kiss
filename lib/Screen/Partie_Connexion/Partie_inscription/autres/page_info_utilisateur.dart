import 'dart:io';

import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageEnregistrementInfoUtilisateur extends StatefulWidget {
  const PageEnregistrementInfoUtilisateur({super.key, required this.pageController});

  final PageController pageController; // Ajouter cette ligne

  @override
  State<PageEnregistrementInfoUtilisateur> createState() =>
      _PageEnregistrementInfoUtilisateurState();
}

class _PageEnregistrementInfoUtilisateurState
    extends State<PageEnregistrementInfoUtilisateur> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton(
            onPressed: () {
              setState(() {
                widget.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
            child: Text("Precedent"),
          ),
        leadingWidth: 100,
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
            child: Text("Finish"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(150),
                width: double.infinity,
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : AssetImage("assets/icons/img/icon_personne.png") as ImageProvider,
                    child: Align(
                      alignment: Alignment(1, 1.25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 225, 225),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(
                            Icons.photo_camera,
                            color: kPrimaryColor,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20),
                ),
                decoration: InputDecoration(
                  labelText: "Nom d'utilisation",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // hintText: "Enter votre nom d'utilisateur",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20),
                ),
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // hintText: "Enter votre nom d'utilisateur",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20),
                ),
                decoration: InputDecoration(
                  labelText: "Confirmation du mot de passe",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // hintText: "Enter votre nom d'utilisateur",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
