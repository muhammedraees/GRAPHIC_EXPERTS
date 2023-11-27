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
        title: const Text('About Us'),
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
            Text(
              'Welcome to Graphic Experts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'About Us:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'We are a platform that bridges the gap between freelancers and clients, providing a space for them to connect, collaborate, and achieve their project goals.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Key Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text('- Create and showcase your profile with job type, experience, skills, username, and links to your social media or website.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Search for and connect with clients for potential projects.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Request to work on job posts created by clients.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Chat with clients to discuss project details and requirements.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('- Filter job posts by category and find projects that match your skills.', style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            Text(
              'Start connecting with clients, showcase your skills, and land exciting projects!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
