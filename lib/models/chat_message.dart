import 'dart:io';

import 'package:ksu_app/models/user_profile.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final File? image;
  final File? audio;

  ChatMessage({
    required this.text, 
    required this.isUser, 
    required this.timestamp,
    this.image,
    this.audio, 
  });

  static ChatMessage mockMessage() {
    return ChatMessage(
      text: "اهلا ${UserProfile.mockProfile().firstName}, كيف يمكنني مساعدتك الان؟",
      isUser: false,
      timestamp: DateTime.now(),
    );
  }
}