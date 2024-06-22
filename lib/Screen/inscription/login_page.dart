import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:babikiss/Screen/inscription/login_email/sign_in.dart';
import 'package:babikiss/Screen/inscription/login_number.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:babikiss/components/widgets_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize size configuration

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: getProportionateScreenHeight(200),
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo_baby.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const Text(
                    'Sign up to continue',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  nexBoutonPlein(
                    context,
                    "Continue with Email",
                   SignInPage(),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  nexBoutonVide(
                    context,
                    "Continue with Google",
                    const LoginNumberPage(),
                  ),
                  SizedBox(height: getProportionateScreenHeight(180),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: kPrimaryLightColor,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: const Text('Or sign up with'),
                        ),
                        Expanded(
                          child: Divider(
                            color: kPrimaryLightColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      boutonReseauxSociaux(FontAwesomeIcons.facebookF),
                      boutonReseauxSociaux(FontAwesomeIcons.apple),
                      boutonReseauxSociaux(FontAwesomeIcons.google),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget boutonReseauxSociaux(IconData icon, {VoidCallback? fction}) {
  return Container(
    width: getProportionateScreenWidth(60), // Dynamically adjust the width
    height: getProportionateScreenHeight(60), // Dynamically adjust the height
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: kPrimaryLightColor,
        width: 2,
      ),
      shape: BoxShape.rectangle,
    ),
    child: Center(
      child: IconButton(
        onPressed: fction ?? () {},
        icon: Icon(
          icon,
          color: Colors.black,
          size: getProportionateScreenWidth(24), // Adjust icon size
        ),
      ),
    ),
  );
}
