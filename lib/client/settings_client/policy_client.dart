import 'package:flutter/material.dart';

class ClientPrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Privacy Policy'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFE5B2A),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 40),
            // Text(
            //   'Client Privacy Policy',
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
            // ),
            SizedBox(height: 20),
            Text(
              'Welcome to the Client Side of the App!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              '1. We respect your privacy and protect your personal information.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              '2. We collect and use your data as described in our Privacy Policy.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            // Add more privacy policy details as needed.
            SizedBox(height: 20),
            Text(
              'Please review the complete Privacy Policy for a detailed understanding of how we handle your data as a client.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
