import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(BuildContext) onTap;

  const DatePickerField({required this.selectedDate, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        height: getProportionateScreenHeight(70),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryLightColor, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10)),
          child: selectedDate == null
              ? Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: kPrimaryColor,
                      size: getProportionateScreenWidth(22),
                    ),
                    SizedBox(width: getProportionateScreenWidth(5)),
                    Text(
                      "Date de Naissance",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(15),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(16)),
                  child: Text(
                    DateFormat('dd-MM-yyyy').format(selectedDate!),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(20)),
                  ),
                ),
        ),
      ),
    );
  }
}
