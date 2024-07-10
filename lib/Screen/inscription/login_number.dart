import 'package:babikiss/Screen/inscription/otp/verification_number.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginNumberPage extends StatefulWidget {
  const LoginNumberPage({super.key});

  @override
  State<LoginNumberPage> createState() => _LoginNumberPageState();
}

class _LoginNumberPageState extends State<LoginNumberPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize size configuration

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boutonReseauxSociaux(
              FontAwesomeIcons.angleDoubleLeft,
              fction: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Text(
              "My mobile",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                getProportionateScreenHeight(20),
                0,
                getProportionateScreenHeight(30),
              ),
              child: Text(
                "Entrez un numéro de téléphone valide. Nous vous avons envoyé un code à 4 chiffres pour vérifier votre compte.",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryLightColor,
                    ),
                  ),
                ),
                initialCountryCode: 'CI', // Initial country code
                onChanged: (phone) {
                  print(phone.completeNumber); // Print the complete phone number
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20.5)),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: Size(
                    getProportionateScreenWidth(320),
                    getProportionateScreenHeight(70),
                  ), // Dynamically adjust the button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide.none,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationNumberPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}