// import 'package:flutter/material.dart';
// import 'package:graphic_experts/freelancer/profile_save.dart';
// // import 'package:graphic_experts/freelancer/profile_save.dart';

// import '../auth_steps/user_auth/presentation/pages/sign_up_page.dart';
// import '../freelancer/chat_page.dart';
// import '../freelancer/profile_test.dart';
// import '../screens/freelancerbottomvav.dart';
// import '../screens/settings_page.dart';

// class ButtonRow extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SquareButton(
//                 text: 'Chat List',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ChatListPage()),
//                   );
//                 },
//               ),
//               SquareButton(
//                 text: 'BottomNav',
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => FreelancerBottomNav()));
//                 },
//               ),
//               SquareButton(
//                 text: 'Sign up',
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SignUpPage()));
//                 },
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SquareButton(
//                 text: 'Settings',
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SettingsPage()));
//                 },
//               ),
//               SquareButton(
//                 text: 'Edit',
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()));
//                 },
//               ),
//               SquareButton(
//                 text: 'Prof Create',
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SendOrUpdateData()));
//                 },
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SquareButton(
//                 text: 'Button 7',
//                 onPressed: () {},
//               ),
//               SquareButton(
//                 text: 'Button 8',
//                 onPressed: () {},
//               ),
//               SquareButton(
//                 text: 'Button 9',
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SquareButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   SquareButton({required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         primary: (Color(0xFFFE5B2A)),
//         minimumSize: Size(120, 120),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
