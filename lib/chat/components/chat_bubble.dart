// import 'package:flutter/material.dart';

// class ChatBubble extends StatelessWidget {
//   final  String message; 
//   const ChatBubble({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.blue,
//       ),
//       child: Text(message,
//       style: const TextStyle(fontSize: 16,color: Colors.white),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ChatBubble extends StatelessWidget {
//   final String message;
//   final Color backgroundColor; // Add a parameter for background color.

//   const ChatBubble({Key? key, required this.message, required this.backgroundColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: backgroundColor, // Use the provided background color.
//       ),
//       child: Text(
//         message,
//         style: const TextStyle(fontSize: 16, color: Colors.white),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentMessage;
  final String time;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSentMessage,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSentMessage ? 16.0 : 0.0),
          topRight: Radius.circular(isSentMessage ? 0.0 : 16.0),
          bottomLeft: const Radius.circular(16.0),
          bottomRight: const Radius.circular(16.0),
        ),
        color: isSentMessage ? const Color(0xFFFE5B2A) : const Color.fromARGB(255, 226, 223, 223),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
