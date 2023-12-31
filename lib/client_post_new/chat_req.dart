import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRequestPage extends StatefulWidget {
  final String receiverUserId;
  final String receiverUserEmail;

  ChatRequestPage({
    required this.receiverUserId,
    required this.receiverUserEmail,
    required String receiverUserID,
  });

  @override
  _ChatRequestPageState createState() => _ChatRequestPageState();
}

class _ChatRequestPageState extends State<ChatRequestPage> {
  final TextEditingController messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Set isLoading to true initially and then set it to false when the data is loaded.
    isLoading = true;
    loadChatData();
  }

  void loadChatData() {
    getChatStream().listen((snapshot) {
      setState(() {
        isLoading = false;
      });
    });
  }

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
        await FirebaseFirestore.instance
            .collection('chat_rooms')
            .doc(chatRoomId)
            .collection('message')
            .add({
          'senderId': currentUserId,
          'senderEmail': currentUser.email,
          'receiverId': widget.receiverUserId,
          'message': messageController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20201F),
      appBar: AppBar(
        title: Text(
          'Send a Request ${widget.receiverUserEmail}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF20201F),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : StreamBuilder(
                    stream: getChatStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final List<QueryDocumentSnapshot> messages =
                            snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message =
                                messages[index].data() as Map<String, dynamic>;
                            return ListTile(
                              subtitle: Text(
                                message['message'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: messageController,
                            decoration: const InputDecoration(
                              hintText: 'Type request...',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: sendRequest,
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xFFFE5B2A),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> getChatStream() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      String currentUserId = currentUser.uid;

      List<String> userIds = [currentUserId, widget.receiverUserId];
      userIds.sort();
      String chatRoomId = userIds.join("_");

      return FirebaseFirestore.instance
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('message')
          .orderBy('timestamp', descending: true)
          .snapshots();
    } else {
      return const Stream.empty();
    }
  }
}
