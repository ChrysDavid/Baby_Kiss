import 'package:babikiss/Screen/inscription/login_page.dart';
import 'package:flutter/material.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: Colors.pink[300],
          ),
          // Upper semi-circle
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Center elements
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stack(
                //   clipBehavior: Clip.none,
                //   children: [
                //     // Heart icon
                //     Positioned(
                //       top: 70,
                //       left: 75,
                //       child: Icon(
                //         Icons.favorite,
                //         color: Colors.white,
                //         size: 50,
                //       ),
                //     ),
                //     // User images
                //     Positioned(
                //       top: 10,
                //       left: 50,
                //       child: Container(
                //         width: 60,
                //         height: 60,
                //         child: CircleAvatar(
                //           backgroundImage: AssetImage('assets/images/image.png'), // Replace with your image path
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: 30,
                //       right: 50,
                //       child: Container(
                //         width: 60,
                //         height: 60,
                //         child: CircleAvatar(
                //           backgroundImage: AssetImage('assets/images/image.png'), // Replace with your image path
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: 120,
                //       left: 30,
                //       child: Container(
                //         width: 60,
                //         height: 60,
                //         child: CircleAvatar(
                //           backgroundImage: AssetImage('assets/images/image.png'), // Replace with your image path
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: 130,
                //       right: 30,
                //       child: Container(
                //         width: 60,
                //         height: 60,
                //         child: CircleAvatar(
                //           backgroundImage: AssetImage('assets/images/image.png'), // Replace with your image path
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),
                Text(
                  'A babi il y \'a de l\'attiéké, de l\'alloco,\nmais aussi......\nde l\'amour !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                // Start button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 40.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Commencez maintenant 🙌',
                      style: TextStyle(
                        color: Colors.pink[300],
                        fontSize: 16,
                      ),
                    ),
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
