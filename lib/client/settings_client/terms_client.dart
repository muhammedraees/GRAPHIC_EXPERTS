import 'package:flutter/material.dart';

class ClientTermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Terms and Conditions'),
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
            // Text(
            //   'Client Terms and Conditions',
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
            // ),
            SizedBox(height: 20),
            Text(
              'Welcome to the Client Side of the App!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              '1. By using our app, you agree to abide by our Terms and Conditions.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              '2. You are responsible for the accuracy of the information you provide in job posts and messages.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            // Add more terms and conditions as needed.
            SizedBox(height: 20),
            Text(
              'Please review the complete Terms and Conditions for a detailed understanding of your responsibilities and rights as a client.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
