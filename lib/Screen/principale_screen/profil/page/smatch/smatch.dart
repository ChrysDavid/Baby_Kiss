

import 'package:babikiss/constants.dart';
import 'package:babikiss/size_config.dart';
import 'package:flutter/material.dart';

class SmatchPage extends StatefulWidget {
  const SmatchPage({super.key});

  @override
  State<SmatchPage> createState() => _SmatchPageState();
}

class _SmatchPageState extends State<SmatchPage> {
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialiser SizeConfig
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Smaths"),
      ),
      body: SingleChildScrollView(
        child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02, horizontal: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Une personne pourrait vous correspondre :",
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02, horizontal: screenWidth * 0.03),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.pink,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Text("Today"),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.pink,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              GridView.builder(
                shrinkWrap: true, // Important to avoid the ListView to take infinite height
                physics: NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
                itemCount: 50,
                itemBuilder: (context, index) {
                  return _customPersonSmach(context);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (screenWidth > 600) ? 4 : 2, // Adapting column count based on screen width
                  crossAxisSpacing: screenWidth * 0.03,
                  mainAxisSpacing: screenHeight * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customPersonSmach(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PageDetaillePersonne(),
      //   ),
      // );
    },
    child: Stack(
      children: [
        Container(
          height: screenHeight * 0.3,
          width: screenWidth * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/images/p1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.015,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kouassi Adou, 25',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.015,
                    fontWeight: FontWeight.bold,
                    wordSpacing: getProportionateScreenWidth(1),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
 minimumSize: Size(getProportionateScreenWidth(50), getProportionateScreenHeight(30)),                    side: BorderSide(color: kPrimaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Suivre',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: screenHeight * 0.012,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
