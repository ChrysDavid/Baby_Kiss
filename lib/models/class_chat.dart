
import 'package:babikiss/models/class_message.dart';

class Chat {
  final String name;
  final String lastMessage;
  final String image;
  final String time;
  final bool isActive;
  final List<ChatMessage> messages;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    this.isActive = false,
    required this.messages,
  });
}