import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(25),
        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(9)),
        
        child: Center(
          child: Text(text,
          style: TextStyle(color: Color(0xFFFE5B2A),
          fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
