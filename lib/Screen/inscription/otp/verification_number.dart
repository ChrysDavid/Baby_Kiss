import 'package:babikiss/Screen/inscription/otp/otp_form.dart';
import 'package:babikiss/Screen/inscription/register_page.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VerificationNumberPage extends StatefulWidget {
  const VerificationNumberPage({super.key});

  @override
  State<VerificationNumberPage> createState() => _VerificationNumberPageState();
}

class _VerificationNumberPageState extends State<VerificationNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacing at the top
                SizedBox(height: SizeConfig.screenHeight * 0.05),

                // Social media button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    boutonReseauxSociaux(
                      FontAwesomeIcons.angleDoubleLeft,
                      fction: () {
                        Navigator.pop(context);
                      },
                    ),
                    // Social media button
                    boutonReseauxSociaux(
                      FontAwesomeIcons.angleDoubleRight,
                      fction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                // Main content
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      // Timer
                      buildTimer(),

                      // Instructions
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight * 0.05),
                        child: Text(
                          "Saisissez le code de vérification que vous avez reçu",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      // OTP Form
                      OtpForm(),

                      // Spacing to the bottom
                      SizedBox(height: SizeConfig.screenHeight * 0.3),

                      // Resend code button
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Renvoyez le code",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: headingStyle,
          ),
        ),
      ],
    );
  }
}
