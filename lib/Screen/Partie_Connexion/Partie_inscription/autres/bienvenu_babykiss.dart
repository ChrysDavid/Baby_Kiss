import 'package:babikiss/Screen/principale_screen/principale_screen.dart';
import 'package:babikiss/components/widgets_list.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageBienvenu extends StatefulWidget {
  const PageBienvenu({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<PageBienvenu> createState() => _PageBienvenuState();
}

class _PageBienvenuState extends State<PageBienvenu> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 3),);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      confettiController.play();
    });
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/illustrator/welcom_back.svg"),
                Text(
                  "Felicitation vous ete maintenant sur BabyKiss",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                nexBoutonPlein(
                  context,
                  "Commencer a chercher l'amour😍",
                  const PrincipaleScreen(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
              ],
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              maxBlastForce: 50,
              minBlastForce: 20,
              gravity: 0.1,
              particleDrag: 0.05,
              canvas: MediaQuery.of(context).size,
            ),
          ),
        ],
    );
  }
}
