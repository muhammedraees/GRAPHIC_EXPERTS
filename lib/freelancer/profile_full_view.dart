import 'package:flutter/material.dart';

import 'home_page.dart';

class FullProfileDialog extends StatelessWidget {
  final UserProfile profile;

  const FullProfileDialog({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color.fromARGB(255, 32, 32, 31),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle profile image
                  },
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
                      radius: 60,
                      child: profile.profileImageURL != null &&
                              profile.profileImageURL.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.network(
                                profile.profileImageURL,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                'assets/images/unknown_profile.jpg',
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Name       :  ${profile.username}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 10),
              Text(
                'Job Type      :  ${profile.jobType}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 10),
              Text(
                'Experience   :  ${profile.experience}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 10),
              Text(
                'Skills             :  ${profile.skills}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
              const SizedBox(height: 10),
              Text(
                'Link               :  ${profile.link}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left, // Align text to the left
              ),
            ],
          ),
        ),
      ),
    );
  }
}
