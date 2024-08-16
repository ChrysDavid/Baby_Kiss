import 'package:babikiss/Screen/Partie_Connexion/Partie_inscription/list_page_inscription.dart';
import 'package:babikiss/Screen/principale_screen/principale_screen.dart';
import 'package:babikiss/models/data/list_users.dart';
import 'package:babikiss/services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:babikiss/size_config.dart';
import 'package:babikiss/components/widgets_list.dart';

class PageConnexion extends StatefulWidget {
  const PageConnexion({super.key});

  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool simpleUIController = false;

  void isObscureActive() {
    setState(() {
      simpleUIController = !simpleUIController;
    });
  }

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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Username or Gmail',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            controller: nameController,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: passwordController,
                            obscureText: simpleUIController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_open),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  simpleUIController
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: isObscureActive,
                              ),
                              hintText: 'Password',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 7) {
                                return 'at least enter 6 characters';
                              } else if (value.length > 13) {
                                return 'maximum character is 13';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text("Forgot password"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  nexBoutonPlein(
                    context,
                    "sign in",
                    PrincipaleScreen()
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("you don't have an account"),
                  ),
                  nexBoutonVide(
                    context,
                    "sign up",
                    const ListDePagePourInscription(),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(100),
                  ),
                  separateur('Or sign up with'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      boutonReseauxSociaux(FontAwesomeIcons.google),
                      boutonReseauxSociaux(FontAwesomeIcons.apple),
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
