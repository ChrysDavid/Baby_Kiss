import 'package:babikiss/constants.dart';
import 'package:flutter/material.dart';

class PronounSelectionField extends StatelessWidget {
  final String? selectedPronoun;
  final void Function() onSelectPronoun;

  const PronounSelectionField({
    required this.selectedPronoun,
    required this.onSelectPronoun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onSelectPronoun,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            selectedPronoun ?? "Pronoms",
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
