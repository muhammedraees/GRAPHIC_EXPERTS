import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/chat_bubble.dart';
import '../components/my_text_field.dart';
import '../services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatPage({
    Key? key,
    required this.receiverUserEmail,
    required this.receiverUserID,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  DateTime? _lastDisplayedDate;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  Widget _buildMessageItem(Map<String, dynamic> data, Alignment alignment,
      Color bubbleColor, String time) {
    DateTime messageTime;
    try {
      messageTime = DateTime.parse(time);
    } catch (e) {
      // Handle the exception, e.g., log it or use a default date
      print('Error parsing date: $e');
      messageTime = DateTime.now();
    }

    final formattedTime = DateFormat.Hm().format(messageTime);

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChatBubble(
          message: data['message'],
          isSentMessage: data['senderId'] == _firebaseAuth.currentUser!.uid,
          time: formattedTime,
        ),
      ),
    );
  }

  Widget _buildDateHeader(DateTime dateTime) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        DateFormat.yMd().format(dateTime),
        style: const TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessage(
          widget.receiverUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        List<Widget> messageWidgets = [];

        for (var document in snapshot.data!.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          DateTime messageTime = data['timestamp'].toDate();
          String time = DateFormat.Hm().format(messageTime);

          if (_lastDisplayedDate == null ||
              !_lastDisplayedDate!.isSameDay(messageTime)) {
            messageWidgets.add(_buildDateHeader(messageTime));
            _lastDisplayedDate = messageTime;
          }

          var isSentMessage =
              (data['senderId'] == _firebaseAuth.currentUser!.uid);
          var alignment =
              isSentMessage ? Alignment.centerRight : Alignment.centerLeft;
          var bubbleColor = isSentMessage ? Colors.grey : Colors.black;

          messageWidgets
              .add(_buildMessageItem(data, alignment, bubbleColor, time));
        }

        return ListView(children: messageWidgets);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        title: Text(
          widget.receiverUserEmail,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: (Color(0xFFFE5B2A)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: 'Enter message',
              obscureText: false,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              color: Color(0xFFFE5B2A),
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
