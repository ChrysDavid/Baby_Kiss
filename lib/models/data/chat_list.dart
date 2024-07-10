import 'package:babikiss/enum.dart';
import 'package:babikiss/models/class_chat.dart';
import 'package:babikiss/models/class_message.dart';

final List<Chat> chatsData = [
    Chat(
      name: "Mon Entreprise",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/profil.png",
      time: "3m ago",
      isActive: false,
      messages: [
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "Hello! How are you?",
          messageTime: "10:00 AM",
          isSender: false,
          messageStatus: MessageStatus.viewed,
        ),
        ChatMessage(
          messageType: ChatMessageType.text,
          messageContent: "I'm good. Thanks for asking!",
          messageTime: "10:02 AM",
          isSender: true,
          messageStatus: MessageStatus.viewed,
        ),
      ],
    ),
  ];