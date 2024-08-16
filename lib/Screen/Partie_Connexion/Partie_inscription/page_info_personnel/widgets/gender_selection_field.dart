import 'package:babikiss/constants.dart';
import 'package:babikiss/enum.dart';
import 'package:flutter/material.dart';

class GenderSelectionField extends StatelessWidget {
  final String? customSex;
  final ReponseSex? selectedSex;
  final void Function() onSelectSex;

  const GenderSelectionField({
    required this.customSex,
    required this.selectedSex,
    required this.onSelectSex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onSelectSex,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            customSex != null
                ? customSex!
                : selectedSex != null
                    ? selectedSex.toString().split('.').last
                    : "Sex",
            style: TextStyle(fontSize: 20, color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
