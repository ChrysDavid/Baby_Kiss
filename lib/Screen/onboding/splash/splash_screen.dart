import 'dart:async';

import 'package:babikiss/Screen/Partie_Connexion/page_connexion.dart';
import 'package:babikiss/Screen/onboding/splash/components/splash_content.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Map<String, String>> splashData = [
    {
      "title": "BabiKiss",
      "text": "À Babi, l'amour a un nouveau nom: BABIKISS",
      "image": "assets/images/SplashScreen/Appreciation.gif"
    },
    {
      "title": "BabiKiss",
      "text":
          "BabiKiss : L'amour à Abidjan, c'est comme un '66' bien frappé, ça désaltère le cœur",
      "image": "assets/images/SplashScreen/In_love.gif"
    },
    {
      "title": "BabiKiss",
      "text":
          "Avec BabiKiss, trouvez votre 'choco' à Abidjan et faites vibrer vos cœurs comme un bon coupé-décalé !",
      "image": "assets/images/SplashScreen/Free-love.gif"
    }
  ];

  Timer? timer; // Timer pour le défilement automatique

  @override
  void initState() {
    super.initState();
    // Démarrer le défilement automatique après un court délai
    Timer(Duration(seconds: 10), startAutoScroll);
  }

  @override
  void dispose() {
    // Arrêter le timer et libérer le PageController lorsque l'écran est supprimé
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void startAutoScroll() {
    const duration = Duration(seconds: 3);
    timer = Timer.periodic(duration, (Timer timer) {
      if (currentPage < splashData.length - 1) {
        currentPage++;
      } else {
        currentPage =
            0; // Revenir à la première page après avoir atteint la dernière page
      }
      pageController.animateToPage(
        currentPage,
        duration: kAnimationDuration,
        curve: Curves.ease,
      );
    });
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 9,
      width: currentPage == index ? 50 : 15,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    title: splashData[index]["title"],
                    image: splashData[index]["image"]!,
                    text: splashData[index]['text']!,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(flex: 3),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                splashData.length,
                                (index) => buildDot(index: index),
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: kBackgroudColor,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageConnexion(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 40,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(flex: 3),
                      // DefaultButton(
                      //   text: "Continue",
                      //   press: () {
                      //     Navigator.pushNamed(context, SignInScreen.routeName);
                      //   },
                      // ),
                      // Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
