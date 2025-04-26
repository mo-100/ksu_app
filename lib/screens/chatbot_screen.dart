import 'dart:io';

import 'package:ksu_app/constants/app_constants.dart';
import 'package:ksu_app/models/chat_message.dart';
import 'package:ksu_app/services/chat_service.dart';
import 'package:ksu_app/widgets/audio/audio_button.dart';
import 'package:ksu_app/widgets/message/chat_messages.dart';
import 'package:ksu_app/widgets/message/message_input_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/custom_app_bar.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isProcessing = false;
  File? _selectedImageFile;
  final ChatService _chatService = ChatService(
    baseUrl: 'http://192.168.157.215:8000',
  );
  final List<ChatMessage> _messages = [
    ChatMessage.mockMessage()
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Function to simulate getting a reply from the bot
  Future<ChatMessage> _getBotReply(String userText, File? userImage) async {
    return await _chatService.sendChatMessage(userText);
  }

  Future<void> _handleSendMessage() async {
    final messageText = _messageController.text.trim();
    final imageFile = _selectedImageFile; // Capture selected image

    // Check if there's text OR an image to send, and not already processing
    if ((messageText.isEmpty && imageFile == null) || _isProcessing) return;

    _messageController.clear();
    // Create the user message immediately
    final userMessage = ChatMessage(
      text: messageText,
      isUser: true,
      timestamp: DateTime.now(),
      image: imageFile, // Include the image
    );

    setState(() {
      _messages.add(userMessage);
      _isProcessing = true;
      _selectedImageFile = null; // Clear the selected image after adding
    });

    _scrollToBottom(); // Scroll after adding user message

    // Get and process the bot's reply
    final botMessage = await _getBotReply(messageText, imageFile);
    setState(() {
      _messages.add(botMessage);
    });
    _scrollToBottom(); // Scroll after adding bot message

    setState(() {
      _isProcessing = false;
    });
  }

  Future<void> _handleSendAudio(File file) async {
    return;
    // Create the user message immediately
    final userMessage = ChatMessage(
      text: '',
      isUser: true,
      timestamp: DateTime.now(),
      audio: file,
    );

    setState(() {
      _messages.add(userMessage);
      _isProcessing = true;
    });

    _scrollToBottom(); // Scroll after adding user message

    // Get and process the bot's reply
    final botMessage = await _chatService.sendAudioMessage(file);
    // final trancsribedText = await speechToText(file);
    // print(trancsribedText);
    // print('\n\n\n');
    // final botMessage = await _chatService.sendPreorderMessage(trancsribedText);
    setState(() {
      _messages.add(botMessage);
    });
    _scrollToBottom(); // Scroll after adding bot message

    setState(() {
      _isProcessing = false;
    });
  }

  void _clearChat() async {
    if (_isProcessing) {
      return;
    }
    setState(() {
      _messages.clear();
      _messages.add(
        ChatMessage.mockMessage(),
      );
    });
    await _chatService.clearChatHistory();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _chooseImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image from the gallery
    // final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImageFile = File(pickedFile.path);
        // Optionally, you could immediately send if only an image is selected,
        // or wait for the user to press send. Current logic waits for send.
        // You might also want to show a preview in MessageInputArea.
      });
    }
    // Handle potential errors or user cancellation if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            onPressed: _clearChat,
            icon: Icon(
              Icons.delete,
              color: AppConstants.iconColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ChatMessages(
            messages: _messages,
            scrollController: _scrollController,
          ),
          MessageInputArea(
            messageController: _messageController,
            isProcessing: _isProcessing,
            onSendMessage: _handleSendMessage,
            icon: false ? IconButton(
              icon: const Icon(Icons.image, color: Colors.grey),
              onPressed: _chooseImage, // Use the callback here
              tooltip: 'Add Image', // Optional: Add a tooltip
            ) : AudioButton(
              onStop: (file) async {
                await _handleSendAudio(file);
              },
            ),
            onClearImage: () => setState(() => _selectedImageFile = null),
            selectedImage: _selectedImageFile,
          ),
        ],
      ),
    );
  }
}
