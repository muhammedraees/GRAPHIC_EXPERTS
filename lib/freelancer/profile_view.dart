import 'package:flutter/material.dart';

import 'home_page.dart';

// import 'search_page.dart';


class UserProfileDetails extends StatelessWidget {
  final UserProfile profile;
  

  UserProfileDetails({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(profile.profileImageURL),
                radius: 80,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Username: ${profile.username}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Job Type: ${profile.jobType}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Experience: ${profile.experience}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Skills: ${profile.skills}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Link: ${profile.link}',
              style: const TextStyle(fontSize: 20),
            ),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
