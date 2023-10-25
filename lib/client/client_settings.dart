// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../screens/login.dart';
// import 'client_profile_page.dart';
import 'settings_client/about_client.dart';
import 'settings_client/policy_client.dart';
import 'settings_client/terms_client.dart';

class ClientSettingsPage extends StatelessWidget {
  const ClientSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Settings'),
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
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color(0xFFFE5B2A),
            ),
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ClientProfilePage()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              color: Color(0xFFFE5B2A),
            ),
            title: const Text(
              'Share',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
           
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.article,
              color: Color(0xFFFE5B2A),
            ),
            title: const Text(
              'Terms and Conditions',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
           
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientTermsAndConditionsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip,
              color: Color(0xFFFE5B2A),
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
           
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientPrivacyPolicyPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Color(0xFFFE5B2A),
            ),
            title: const Text(
              'About',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
          
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xFFFE5B2A),
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
      
            },
          ),
        ],
      ),
    );
  }
}

