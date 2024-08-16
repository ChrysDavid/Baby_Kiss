import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

class RechercheGenderSelect extends StatefulWidget {
  const RechercheGenderSelect({super.key, required this.isSelected});

  final void Function() isSelected;

  @override
  State<RechercheGenderSelect> createState() => _RechercheGenderSelectState();
}

class _RechercheGenderSelectState extends State<RechercheGenderSelect> {
  String genderSelected = "Select";

  void _selectGender(String gender) {
    setState(() {
      genderSelected = gender;
      widget.isSelected();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Je cherche : ",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(17),
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text("Je recherche : "),
                    children: [
                      SimpleDialogOption(
                        child: Text("Un homme"),
                        onPressed: () => _selectGender("Un homme"),
                      ),
                      SimpleDialogOption(
                        child: Text("Une femme"),
                        onPressed: () => _selectGender("Une femme"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              genderSelected,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
