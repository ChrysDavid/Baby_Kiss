import 'package:babikiss/enum.dart';

class ChatMessage {
  final String messageContent;
  final String messageTime;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.messageContent,
    required this.messageTime,
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}