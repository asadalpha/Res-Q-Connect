import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/widgets/customtextfield.dart';
import 'chat_service.dart';
import 'charbubble.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverId;
  final String receiveName;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverId,
    required this.receiveName,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_handleTyping);
    _chatService.updateOnlineStatus(true); // Set online status
  }

  @override
  void dispose() {
    _messageController.removeListener(_handleTyping);
    _messageController.dispose();
    _chatService.updateOnlineStatus(false); // Set offline status
    super.dispose();
  }

  void _handleTyping() {
    if (_messageController.text.isNotEmpty && !_isTyping) {
      _isTyping = true;
      _chatService.updateTypingStatus(true);
    } else if (_messageController.text.isEmpty && _isTyping) {
      _isTyping = false;
      _chatService.updateTypingStatus(false);
    }
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverId, _messageController.text);
      // Clear controller
      _messageController.clear();
      _messageController.dispose();
      _isTyping = false;
      await _chatService.updateTypingStatus(false);
      await _chatService.updateLastActive();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiveName),
      ),
      body: Column(children: [
        Expanded(
          child: _buildMessageList(),
        ),
        // User input
        _builtMessageInput(),
        const SizedBox(
          height: 25,
        ),
      ]),
    );
  }

  // Build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
            children: snapshot.data!.docs
                .map((document) => _builtMessageItem(document))
                .toList());
      },
      stream: _chatService.getMessage(
        widget.receiverId,
        _firebaseAuth.currentUser!.uid,
      ),
    );
  }

  // Message item
  Widget _builtMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // Align
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid
        ? Alignment.centerRight
        : Alignment.centerLeft);
    return Container(
      alignment: alignment,
      child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start),
          mainAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid
              ? MainAxisAlignment.end
              : MainAxisAlignment.start),
          children: [
            // Text(data['senderEmail']),
            const SizedBox(height: 5),
            ChatBubble(message: data['message'])
          ]),
    );
  }

  // Message input
  Widget _builtMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
                controller: _messageController,
                maxLines: 1,
                text1: "Enter message"),
          ),
          IconButton(
              onPressed: () {
                sendMessage();
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 40,
              ))
        ],
      ),
    );
  }
}
