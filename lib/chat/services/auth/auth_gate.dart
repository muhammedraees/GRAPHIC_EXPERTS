import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:sampl_rest/chat/services/auth/login_or_register.dart';

import '../../../screens/freelancerbottomvav.dart';
// import '../../pages/home_page.dart';
import 'login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FreelancerBottomNav();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
