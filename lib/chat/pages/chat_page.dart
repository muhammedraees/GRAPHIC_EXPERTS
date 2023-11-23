// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:sampl_rest/chat/components/chat_bubble.dart';
// import 'package:sampl_rest/chat/components/my_text_field.dart';
// import 'package:sampl_rest/chat/services/chat/chat_service.dart';

// class ChatPage extends StatefulWidget {
//   final String receiverUserEmail;
//   final String receiverUserID;
//   const ChatPage(
//       {super.key,
//       required this.receiverUserEmail,
//       required this.receiverUserID});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController _messageController = TextEditingController();
//   final ChatService _chatService = ChatService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   // void sendMessage() async {
//   //   if (_messageController.text.isEmpty) {
//   //     await _chatService.sendMessage(
//   //         widget.receiverUserID, _messageController.text);
//   //     _messageController.clear();
//   //   }
//   // }
//   void sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       await _chatService.sendMessage(
//           widget.receiverUserID, _messageController.text);
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text(widget.receiverUserEmail)),
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         title: Text(
//           widget.receiverUserEmail,
//           style: TextStyle(
//             color: Colors
//                 .white, // Set the text color to white or your desired color.
//           ),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: (Color(0xFFFE5B2A)),
//             )),
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       ),

//       body: Column(
//         children: [
//           Expanded(
//             child: _buildMessageList(),
//           ),
//           _buildMessageInput(),
//           const SizedBox(
//             height: 25,
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageList() {
//     return StreamBuilder(
//       stream: _chatService.getMessage(
//           widget.receiverUserID, _firebaseAuth.currentUser!.uid),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error${snapshot.error}');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text('Loading..');
//         }
//         return ListView(
//           children: snapshot.data!.docs
//               .map((document) => _buildMessageItem(document))
//               .toList(),
//         );
//       },
//     );
//   }

//   // Widget _buildMessageItem(DocumentSnapshot document){
//   //   Map<String,dynamic> data = document.data() as Map<String,dynamic>;

//   //   var alignment = (data['senderId']==_firebaseAuth.currentUser!.uid);
//   //   ? Alignment.centerRight
//   //   : Alignment.centerLeft;

//   //   return Container(
//   //     alignment: alignment,
//   //   child: Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: Column(
//   //       crossAxisAlignment: (data['senderId']==_firebaseAuth.currentUser!.uid)? CrossAxisAlignment.end: CrossAxisAlignment.start,
//   //       mainAxisAlignment: (data['senderId']== _firebaseAuth.currentUser!.uid)? MainAxisAlignment.end:MainAxisAlignment.start,
//   //       children: [

//   //         Text(data['senderEmail']),
//   //         const SizedBox(height: 5,),
//   //         ChatBubble(message: data['message']),
//   //       ],
//   //     ),
//   //   ),
//   //   );
//   // }

//   // Widget _buildMessageItem(DocumentSnapshot document) {
//   //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;

//   //   var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
//   //       ? Alignment.centerRight
//   //       : Alignment.centerLeft;

//   //   return Container(
//   //     alignment: alignment,
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(8.0),
//   //       child: Column(
//   //         crossAxisAlignment:
//   //             (data['senderId'] == _firebaseAuth.currentUser!.uid)
//   //                 ? CrossAxisAlignment.end
//   //                 : CrossAxisAlignment.start,
//   //         mainAxisAlignment:
//   //             (data['senderId'] == _firebaseAuth.currentUser!.uid)
//   //                 ? MainAxisAlignment.end
//   //                 : MainAxisAlignment.start,
//   //         children: [
//   //           // Text(data['senderEmail']),
//   //           const SizedBox(height: 5),
//   //           ChatBubble(message: data['message']),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget _buildMessageItem(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data() as Map<String, dynamic>;

//     var isSentMessage = (data['senderId'] == _firebaseAuth.currentUser!.uid);
//     var alignment =
//         isSentMessage ? Alignment.centerRight : Alignment.centerLeft;
//     var bubbleColor = isSentMessage
//         ? Colors.grey
//         : Colors.black; // Set different colors for sent and received messages.

//     return Container(
//       alignment: alignment,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment:
//               isSentMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           mainAxisAlignment:
//               isSentMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
//           children: [
//             // Text(data['senderEmail']),
//             const SizedBox(height: 5),
//             ChatBubble(
//               message: data['message'],
//               backgroundColor:
//                   bubbleColor, // Pass the background color based on sender/receiver.
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMessageInput() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: MyTextField(
//                 controller: _messageController,
//                 hintText: 'Enter message',
//                 obscureText: false),
//           ),
//           IconButton(
//               onPressed: sendMessage,
//               icon: const Icon(
//                 Icons.send,
//                 color: Color(0xFFFE5B2A),
//                 size: 30,
//               ))
//         ],
//       ),
//     );
//   }
// }


import 'package:intl/intl.dart'; // Import the intl package for date formatting.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  Widget _buildMessageItem(Map<String, dynamic> data, Alignment alignment, Color bubbleColor, String time) {
    final messageTime = DateTime.parse(time);
    final formattedTime = DateFormat.jm().format(messageTime); // Format time as "2:34 pm".

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChatBubble(
          message: data['message'],
          isSentMessage: data['senderId'] == _firebaseAuth.currentUser!.uid,
          time: formattedTime, // Use formattedTime instead of the original time.
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
          String time = messageTime.toString(); // Convert the message time to a formatted string.

          var isSentMessage = (data['senderId'] == _firebaseAuth.currentUser!.uid);
          var alignment = isSentMessage ? Alignment.centerRight : Alignment.centerLeft;
          var bubbleColor = isSentMessage ? Colors.grey : Colors.black;

          messageWidgets.add(_buildMessageItem(data, alignment, bubbleColor, time));
        }

        return ListView(children: messageWidgets);
      },
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
}
