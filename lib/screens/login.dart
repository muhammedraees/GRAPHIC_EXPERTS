// import 'package:flutter/material.dart';

// import 'bottom_nav.dart';
// import 'signup.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Email',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
//                 );
//               },
//               child: Text('Login'),
//             ),
//             SizedBox(height: 10.0),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupPage()),
//                 );
//               },
//               child: Text('Don\'t have an account? Sign up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import 'client_home_page.dart';
import 'freelancerbottomvav.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  final String userType;
  final bool isLoggedIn;

  LoginPage(this.userType, this.isLoggedIn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextFieldWithBox(
              hintText: 'Email',
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 20.0),
            _buildTextFieldWithBox(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFFFE5B2A),
                    ),
                  ),
                  onPressed: () {
                    if (isLoggedIn) {
                   
                      if (userType == 'Client') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClientHomePage(),
                          ),
                        );
                      } else if (userType == 'Freelancer') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FreelancerBottomNav(),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(userType),
                  ),
                );
              },
              child: Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithBox({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: isPassword,
      ),
    );
  }
}
