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

import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Color backgroundColor; // Add a parameter for background color.

  const ChatBubble({Key? key, required this.message, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor, // Use the provided background color.
      ),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
