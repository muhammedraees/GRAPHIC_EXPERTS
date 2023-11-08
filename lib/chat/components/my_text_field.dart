import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      fillColor: Colors.grey[200],
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      
      ),
    );
  }
  //  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 50, 
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(5.0), 
  //       color: Colors.grey[200], 
  //     ),
  //     child: TextField(
  //       controller: controller,
  //       obscureText: obscureText,
  //       decoration: InputDecoration(
  //         enabledBorder: InputBorder.none, 
  //         focusedBorder: InputBorder.none, 
  //         hintText: hintText,
  //         hintStyle: const TextStyle(color: Colors.grey),
  //       ),
  //     ),
  //   );
  // }
}
