import 'package:babikiss/Screen/inscription/def_genre_page.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime? selectedDate;

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialiser SizeConfig pour récupérer les dimensions de l'écran
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    boutonReseauxSociaux(FontAwesomeIcons.angleDoubleLeft, fction: () {
                      Navigator.pop(context);
                    }),
                    boutonReseauxSociaux(
                      FontAwesomeIcons.angleDoubleRight,
                      fction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenrePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  "Détails profile",
                  style: headingStyle,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  height: getProportionateScreenHeight(250),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/profile1.png",
                          height: getProportionateScreenHeight(160),
                        ),
                      ),
                      Positioned(
                        left: getProportionateScreenWidth(184),
                        top: getProportionateScreenHeight(125),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/icons/img/camera_icon.png",
                            height: getProportionateScreenHeight(160),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50)),
                TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20)),
                  decoration: InputDecoration(
                    labelText: "Prénom(s)",
                    labelStyle: TextStyle(
                        color: kPrimaryColor),
                    hintText: "Enter votre prénom",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
                SizedBox(height: getProportionateScreenHeight(20)),
                TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20)),
                  decoration: InputDecoration(
                    labelText: "Nom",
                    labelStyle: TextStyle(
                        color: kPrimaryColor),
                    hintText: "Enter votre nom",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
                SizedBox(height: getProportionateScreenHeight(20)),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: getProportionateScreenHeight(70),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: kPrimaryLightColor,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                      child: selectedDate == null
                          ? Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: getProportionateScreenWidth(24),
                                ),
                                SizedBox(width: getProportionateScreenWidth(5)),
                                Text("Date de Naissance"),
                              ],
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(16)),
                              child: Text(
                                DateFormat('dd-MM-yyyy').format(selectedDate!),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(20)),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50)),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: Size(double.infinity, getProportionateScreenHeight(60)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide.none,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: getProportionateScreenWidth(20)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenrePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

