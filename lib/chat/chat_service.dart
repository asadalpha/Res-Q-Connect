import 'package:resq_connect/chat/chatmodel/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email ?? '';

    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());

    // Update last active timestamp
    await updateLastActive();
  }

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Future<void> updateLastActive() async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    await _firestore.collection('users').doc(currentUserId).update({
      'lastActive': timestamp,
    });
  }

  Future<void> updateTypingStatus(bool isTyping) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;

    await _firestore.collection('users').doc(currentUserId).update({
      'isTyping': isTyping,
    });
  }

  Future<void> updateOnlineStatus(bool isOnline) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;

    await _firestore.collection('users').doc(currentUserId).update({
      'online': isOnline,
    });
  }
}
