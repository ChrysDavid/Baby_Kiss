import 'package:babikiss/Screen/onboding/splash/splash_screen.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => SplashScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color.fromARGB(255, 255, 195, 215), // Couleur de fond principale
          ),
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: getProportionateScreenWidth(185),
              height: getProportionateScreenHeight(185),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: -110,
            child: Container(
              width: getProportionateScreenWidth(280),
              height: getProportionateScreenHeight(280),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -50,
            child: Container(
              width: getProportionateScreenWidth(190),
              height: getProportionateScreenHeight(190),
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_baby.png',
                  width: getProportionateScreenWidth(150),
                  height: getProportionateScreenHeight(150),
                ),
                Text(
                  'Babikiss',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(24),
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
