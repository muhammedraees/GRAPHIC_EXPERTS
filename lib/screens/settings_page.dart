import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../freelancer/profile_details.dart';
import '../freelancer/profile_editing.dart';
import '../freelancer/profile_save.dart';
import '../freelancer/profile_test.dart';

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
          SizedBox(
            height: 50,
          ),
          ListTile(
            leading: Icon(Icons.person,
              color: Color(0xFFFE5B2A)),
            title: const Text('Profile',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SendOrUpdateData()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: Color(0xFFFE5B2A), 
            ),
            title: Text(
              'Share',
              style: TextStyle(
                color: Colors.white, 
              ),
            ),
            onTap: () {
           
            },
          ),
          ListTile(
            leading: Icon(Icons.article,
              color: Color(0xFFFE5B2A)),
            title: const Text('Terms and Conditions',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
          
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileEditingPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip,
              color: Color(0xFFFE5B2A)),
            title: const Text('Privacy Policy',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info,
              color: Color(0xFFFE5B2A)),
            title: const Text('About',
              style: TextStyle(
                color: Colors.white, 
              ),),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout,
              color: Color(0xFFFE5B2A)),
            title: const Text('Log Out',
              style: TextStyle(
                color: Colors.white,
              ),),
            onTap: () {
        
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => LogOut()),
              // );
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
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

