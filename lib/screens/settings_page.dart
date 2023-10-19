import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:graphic_experts/screens/onboarding.dart';

// import '../freelancer/profile_details.dart';
import '../freelancer/profile_details.dart';
// import '../freelancer/profile_editing.dart';
import '../freelancer/profile_save.dart';
import '../freelancer/profile_create.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: const Icon(Icons.person,
              color: Color(0xFFFE5B2A)),
            title: const Text('Profile',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SendOrUpdateData()),
              );
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
            leading: const Icon(Icons.article,
              color: Color(0xFFFE5B2A)),
            title: const Text('Terms and Conditions',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEdit()),
              );
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip,
              color: Color(0xFFFE5B2A)),
            title: const Text('Privacy Policy',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
              
              
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => OnboardingPage()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info,
              color: Color(0xFFFE5B2A)),
            title: const Text('About',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileDetailsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout,
              color: Color(0xFFFE5B2A)),
            title: const Text('Log Out',
              style: TextStyle(
                color: Colors.white,
              ),),
            // onTap: () {
        
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => LogOut()),
            //   // );
            //   FirebaseAuth.instance.signOut();
            //   Navigator.pushNamed(context, "/login");
            // },
onTap: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31), // Set the dialog background color to grey
        title: const Text(
          "Confirm Logout",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        content: const Text(
          "Are you sure you want to log out ?",
          style: TextStyle(color: Colors.white), // Set the text color to white
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              // backgroundColor: Colors.white, // Set the button background color to white
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey), // Set the button text color to grey
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              // backgroundColor: Colors.white, // Set the button background color to white
            ),
            child: const Text(
              "Yes",
              style: TextStyle(color: Color(0xFFFE5B2A)), // Set the button text color to grey
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      );
    },
  );
},
          ),
        ],
      ),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
    
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
  
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
    
    );
  }
}

