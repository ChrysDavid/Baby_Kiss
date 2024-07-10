// ignore_for_file: unused_local_variable

import 'package:babikiss/Screen/principale_screen/Chats/components/Message_screen.dart';
import 'package:babikiss/Screen/principale_screen/Chats/components/page_stories.dart';
import 'package:babikiss/models/class_chat.dart';
import 'package:babikiss/models/data/chat_list.dart';
import 'package:babikiss/models/user.dart';
import 'package:flutter/material.dart';
import 'package:babikiss/constants.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/message";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> _selectedChats = [];
  List<User> stories = [];

  void _selectChat(Chat chat) {
    setState(() {
      if (_selectedChats.contains(chat)) {
        _selectedChats.remove(chat);
      } else {
        _selectedChats.add(chat);
      }
    });
  }

  void _deleteSelectedChats() {
    setState(() {
      chatsData.removeWhere((chat) => _selectedChats.contains(chat));
      _selectedChats.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildChatList() {
      if (chatsData.isEmpty) {
        return Center(
          child: Text(
            "Vous n'avez aucune conversation.",
            style: TextStyle(fontSize: 16),
          ),
        );
      } else {
        return ListView.builder(
          shrinkWrap:
              true, // Important to avoid the ListView to take infinite height
          physics:
              NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
          itemCount: chatsData.length,
          itemBuilder: (context, index) {
            final chat = chatsData[index];
            final isSelected = _selectedChats.contains(chat);
            return LongPressSelectionDetector(
              child: ChatCard(
                chat: chat,
                press: () {
                  if (_selectedChats.isNotEmpty) {
                    _selectChat(chat);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagesScreen(chat: chat),
                      ),
                    );
                  }
                },
                isSelected: isSelected,
              ),
              onLongPress: () {
                _selectChat(chat);
              },
            );
          },
        );
      }
    }

    bool isSelectingMode = _selectedChats.isNotEmpty;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // stories.isEmpty
              //     ? Container()
              //     : 
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Activités",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return activityAvatar(context, "Majo",
                                  "assets/images/p1.png", true);
                            },
                          ),
                        ),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Messages",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              // chatsData.isNotEmpty
              //     ? Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SvgPicture.asset(
              //             "assets/illustrator/chats_empty.svg",
              //             height: 300,
              //           ),
              //           Text(
              //             "Aucun message pour le moment",
              //             style: TextStyle(
              //                 fontSize: 20, fontWeight: FontWeight.w500),
              //           ),
              //         ],
              //       )
              //     : 
                  Column(
                      children: [
                        buildChatList(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget activityAvatar(
    BuildContext context, String name, String imagePath, bool hasStory) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StoryPage()));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2), // Padding to create the border
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: hasStory
                    ? Colors.red
                    : Colors.transparent, // Red border if user has a story
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              // backgroundColor: Colors.blue,

              backgroundImage: AssetImage(imagePath),
            ),
          ),
          SizedBox(height: 4),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    ),
  );
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        color: isSelected ? Colors.red.withOpacity(0.2) : null,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 0.75,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(chat.image),
            ),
            SizedBox(width: kDefaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      chat.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(
                chat.time,
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LongPressSelectionDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onLongPress;

  const LongPressSelectionDetector({
    Key? key,
    required this.child,
    required this.onLongPress,
  }) : super(key: key);

  @override
  _LongPressSelectionDetectorState createState() =>
      _LongPressSelectionDetectorState();
}

class _LongPressSelectionDetectorState
    extends State<LongPressSelectionDetector> {
  bool _isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isLongPressed = true;
        });
        widget.onLongPress();
      },
      onTap: () {
        if (_isLongPressed) {
          setState(() {
            _isLongPressed = false;
          });
        } else {
          // Handle normal tap action
        }
      },
      child: widget.child,
    );
  }
}
