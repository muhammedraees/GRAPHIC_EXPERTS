import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('About'),
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
            SizedBox(height: 40),
            Text(
              'Welcome to the Graphic Experts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text('- Create job posts and find skilled freelancers for your projects.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Connect and chat with freelancers to discuss your requirements.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Filter freelancers by job category and skills.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Collaborate efficiently and find the right talent for your projects.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            Text(
              'Get started today and find the perfect freelancer for your projects!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
