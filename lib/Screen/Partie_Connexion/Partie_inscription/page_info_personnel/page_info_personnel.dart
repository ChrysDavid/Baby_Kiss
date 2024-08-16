import 'dart:async';

import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/page_info_personnel/widgets/custom_text_field.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/page_info_personnel/widgets/date_picker_field.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/page_info_personnel/widgets/gender_selection_field.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/page_info_personnel/widgets/pronoun_selection_field.dart';
import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/page_info_personnel/widgets/recherche_gender_select.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/enum.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

class PageEnregistrementInfosPersonnelles extends StatefulWidget {
  const PageEnregistrementInfosPersonnelles(
      {super.key, required this.pageController,});

  final PageController pageController; // Ajouter cette ligne

  @override
  State<PageEnregistrementInfosPersonnelles> createState() =>
      _PageEnregistrementInfosPersonnellesState();
}

class _PageEnregistrementInfosPersonnellesState
    extends State<PageEnregistrementInfosPersonnelles> {
  DateTime? selectedDate;
  ReponseSex? _selectedSex;
  String? _selectedPronoun;
  String? _customSex;
  bool _rechercheGender = false;

  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      bool allFilled = areAllFieldsFilled();
      setState(() {
        print("Toutes les valeurs sont remplies : $allFilled");
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Annuler le timer lorsqu'on quitte le widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Nom",
                controller: _nomController,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              CustomTextField(
                labelText: "Prénom(s)",
                controller: _prenomController,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              DatePickerField(
                selectedDate: selectedDate,
                onTap: _selectDate,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderSelectionField(
                    customSex: _customSex,
                    selectedSex: _selectedSex,
                    onSelectSex: _showGenderDialog,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  PronounSelectionField(
                    selectedPronoun: _selectedPronoun,
                    onSelectPronoun: _showPronounDialog,
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              RechercheGenderSelect(
                isSelected: () {
                  setState(() {
                    _rechercheGender = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour vérifier si tous les champs sont remplis
  bool areAllFieldsFilled() {
    return _prenomController.text.isNotEmpty &&
        _nomController.text.isNotEmpty &&
        selectedDate != null &&
        (_selectedSex != null || _customSex != null) &&
        _selectedPronoun != null &&
        _rechercheGender == true;
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showModalBottomSheet<DateTime?>(
      context: context,
      builder: (BuildContext context) {
        return CalendarBottomSheet(
          onDateSelected: (date) {
            Navigator.pop(context, date);
          },
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showGenderDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Sélectionnez votre sexe"),
          children: [
            SimpleDialogOption(
              child: const Text("Homme"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.homme;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Femme"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.femme;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Non-binaire"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.nonBinaire;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Genre fluide"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.genreFluide;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Transgenre homme"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.transgenreHomme;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Transgenre femme"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.transgenreFemme;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Agender (sans genre)"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.agender;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Intersexe"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.intersexe;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Préférer ne pas dire"),
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.prefererNePasDire;
                  _customSex = null;
                });
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Autre (spécifier)"),
              onPressed: () {
                Navigator.pop(context); // Fermer le premier dialogue
                _showCustomSexDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showCustomSexDialog(BuildContext context) {
    String? tempCustomSex;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Entrez votre sexe"),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Veuillez spécifier",
            ),
            onChanged: (value) {
              tempCustomSex = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedSex = ReponseSex.autre;
                  _customSex = tempCustomSex;
                });
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showPronounDialog() {
    String? tempPronoun;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Entrez vos pronoms"),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Ex: il/elle/iel",
            ),
            onChanged: (value) {
              tempPronoun = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedPronoun = tempPronoun;
                });
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
