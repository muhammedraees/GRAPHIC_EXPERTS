import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatRequestPage extends StatefulWidget {
  final String receiverUserId;
  final String receiverUserEmail;

  ChatRequestPage({
    required this.receiverUserId,
    required this.receiverUserEmail,
  });

  @override
  _ChatRequestPageState createState() => _ChatRequestPageState();
}

class _ChatRequestPageState extends State<ChatRequestPage> {
  final TextEditingController messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendRequest() async {
    if (messageController.text.isNotEmpty) {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        String currentUserId = currentUser.uid;

        // Create a Chat Room ID to uniquely identify the conversation
        List<String> userIds = [currentUserId, widget.receiverUserId];
        userIds.sort();
        String chatRoomId = userIds.join("_");

        // Send the request message
        await FirebaseFirestore.instance.collection('chat_rooms').doc(chatRoomId).collection('message').add({
          'senderId': currentUserId,
          'senderEmail': currentUser.email,
          'receiverId': widget.receiverUserId,
          'message': messageController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        Navigator.pop(context); // Close the Chat Request Page after sending the request.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send a Request to ${widget.receiverUserEmail}'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
  stream: getChatStream(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      final List<QueryDocumentSnapshot> messages = snapshot.data!.docs;

      return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index].data() as Map<String, dynamic>;
          // Build the chat message here, e.g., display sender, receiver, and message content.
          return ListTile(
            title: Text(message['senderEmail']),
            subtitle: Text(message['message']),
          );
        },
      );
    }
  },
),

          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(hintText: 'Type your request...'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: sendRequest,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> getChatStream() {
  final currentUser = _auth.currentUser;
  if (currentUser != null) {
    String currentUserId = currentUser.uid;

    // Create a Chat Room ID to identify the conversation
    List<String> userIds = [currentUserId, widget.receiverUserId];
    userIds.sort();
    String chatRoomId = userIds.join("_");

    // Retrieve chat messages specific to this conversation
    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('message')
        .orderBy('timestamp', descending: true)
        .snapshots();
  } else {
    // Handle the case where the user is not signed in
    return Stream.empty();
  }
}

}
