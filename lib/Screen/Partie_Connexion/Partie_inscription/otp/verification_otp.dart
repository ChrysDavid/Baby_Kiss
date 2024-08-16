import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/otp/otp_form.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

class VerificationOTP extends StatefulWidget {
  const VerificationOTP(
      {super.key, required this.numberPhone, required this.pageController});

  final String? numberPhone;
  final PageController pageController; // Ajouter cette ligne

  @override
  State<VerificationOTP> createState() => _VerificationOTPState();
}

class _VerificationOTPState extends State<VerificationOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          vertical: SizeConfig.screenHeight * 0.04),
                      child: Text(
                        "Saisissez le code de vérification que vous avez reçu au numero ${widget.numberPhone.toString()}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    // OTP Form
                    OtpForm(
                      pageController: widget.pageController,
                    ),

                    // Spacing to the bottom
                    SizedBox(height: SizeConfig.screenHeight * 0.02),

                    // Resend code button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                            });
                          },
                          child: Text(
                            "Modifier le numero",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
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
                  ],
                ),
              ),
            ],
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
