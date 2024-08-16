import 'package:babikiss/animation/lumineux_progessive_indicator.dart';
import 'package:babikiss/constants.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';

class ItineraitButtonCustom extends StatefulWidget {
  const ItineraitButtonCustom({super.key, required this.user});
  final User user;

  @override
  State<ItineraitButtonCustom> createState() => _ItineraitButtonCustomState();
}

class _ItineraitButtonCustomState extends State<ItineraitButtonCustom> {
  IconData? selectedIcon;

  List<IconData> listIcons = [
    Icons.directions_walk,
    Icons.directions_bike,
    Icons.directions_car,
    Icons.directions_train,
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    setState(() {
      _currentPage++;
      if (_currentPage >= listIcons.length) {
        // Assuming you have 3 pages
        _currentPage = 0;
      }
    });
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
          Icons.directions,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return FractionallySizedBox(
                    heightFactor: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 40),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: kPrimaryColor,
                                      child: Icon(Icons.person),
                                    ),
                                    LumineuxProgressIndicator(),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          widget.user.picture.large,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Moyen de transport",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: listIcons
                                        .asMap()
                                        .entries
                                        .map(
                                          (entry) => IconButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedIcon = entry.value;
                                                _nextPage();
                                              });
                                            },
                                            icon: _buildIconButton(
                                              entry.value,
                                              selectedIcon == entry.value,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 19, vertical: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: 'Distance : ', // Default style
                                        style: TextStyle(fontSize: 24),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '... km',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [Icon(Icons.umbrella),
                                    Text("26%"),
                                    ],
                                    
                                    ),
                                    Column(children: [Icon(Icons.umbrella),
                                    Text("26%"),
                                    ],
                                    
                                    ),
                                    Column(children: [Icon(Icons.umbrella),
                                    Text("26%"),
                                    ],
                                    
                                    ),
                                    Column(children: [Icon(Icons.umbrella),
                                    Text("26%"),
                                    ],
                                    
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        
      );
  }
}

Widget _buildIconButton(IconData icon, bool isSelected) {
  return Container(
      child: isSelected
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(icon, size: 30.0),
              ),
            )
          : Icon(icon, size: 30.0));
}