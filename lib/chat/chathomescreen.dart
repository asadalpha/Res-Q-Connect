import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chatpage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "ResQ Chat",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat-SemiBold"),
        ),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data?.docs ?? [];
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            if (_auth.currentUser?.email != data["email"]) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://nationaltoday.com/wp-content/uploads/2022/05/74-Robert-Pattinson.jpg.webp")),
                  title: Text(
                    data["username"] ?? ' ',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(data["uid"])
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Error");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading...",
                            style: TextStyle(color: Colors.white));
                      }
                      final userData =
                          snapshot.data?.data() as Map<String, dynamic>?;
                      if (userData == null) {
                        return const Text("No data",
                            style: TextStyle(color: Colors.white));
                      }

                      bool isTyping = userData["isTyping"] ?? false;
                      Timestamp? lastActiveTimestamp = userData["lastActive"];
                      bool isOnline = userData["online"] ?? false;
                      String status = isOnline
                          ? 'Online'
                          : (lastActiveTimestamp != null
                              ? 'Last active: ${_formatTimestamp(lastActiveTimestamp)}'
                              : 'Last active: unknown');

                      return Text(
                        isTyping ? "typing..." : status,
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          receiverId: data["uid"] ?? '',
                          receiverUserEmail: data["email"] ?? '',
                          receiveName: data["username"] ?? '',
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}
