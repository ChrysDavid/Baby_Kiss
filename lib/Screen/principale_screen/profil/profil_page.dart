import 'package:babikiss/Screen/principale_screen/profil/page/smatch/smatch.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:babikiss/Screen/principale_screen/profil/composant/profil_menu.dart';
import 'package:babikiss/Screen/principale_screen/profil/page/notification/notification.dart';
import 'package:babikiss/Screen/principale_screen/profil/page/setting/setting.dart';
import 'package:babikiss/size_config.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: getProportionateScreenHeight(100),
                  child: Image.asset("assets/images/logo_baby.png"),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  'Baby Kiss',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenHeight(20),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileMenu(
                    text: "My account",
                    icon: Icons.account_box,
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "Smatch received",
                    icon: Icons.person_add,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmatchPage(),
                        ),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Notifications",
                    icon: Icons.notifications,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotifScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Settings",
                    icon: Icons.settings,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CrossPlatformSettingsScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenu(
                    text: "Help",
                    icon: Icons.help,
                    press: _launchUrl,
                  ),
                  ProfileMenu(
                    text: "Sign out",
                    icon: Icons.output,
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
