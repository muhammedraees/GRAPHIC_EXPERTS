// import 'package:flutter/material.dart';

// import 'signup.dart';

// class UserTypeSelectionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Type Selection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             UserTypeButton(
//               userType: 'Client',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupPage()),
//                 );
//               },
//             ),
//             SizedBox(height: 20.0),
//             UserTypeButton(
//               userType: 'Freelancer',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class UserTypeButton extends StatelessWidget {
//   final String userType;
//   final VoidCallback onTap;

//   UserTypeButton({required this.userType, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: Colors.blue, // Customize the button color
//           borderRadius: BorderRadius.circular(15.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             userType,
//             style: TextStyle(
//               color: Colors.white, // Customize the text color
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';

import '../auth_steps/user_auth/presentation/pages/login_page.dart';
import 'signup.dart';

class UserTypeSelectionPage extends StatefulWidget {
  @override
  _UserTypeSelectionPageState createState() => _UserTypeSelectionPageState();
}

class _UserTypeSelectionPageState extends State<UserTypeSelectionPage> {
  bool isLoggedIn = false; 


  void handleUserSelection(String userType) {
    setState(() {
      isLoggedIn = true;
    });

    if (userType == 'Client') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignupPage(userType)),
      );
    } else if (userType == 'Freelancer') {
      Navigator.push(
        context,
        // MaterialPageRoute(builder: (context) => SignupPage(userType)),
        MaterialPageRoute(builder: (context) => LoginPage()),
        
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      // appBar: AppBar(
      //   title: Text('User Type Selection'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Select user type",style: TextStyle(color: Colors.white,fontSize: 30),),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserTypeButton(
                  userType: 'Client',
                  onTap: () => handleUserSelection('Client'),
                ),
                SizedBox(width: 30.0),
                UserTypeButton(
                  userType: 'Freelancer',
                  onTap: () => handleUserSelection('Freelancer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserTypeButton extends StatelessWidget {
  final String userType;
  final VoidCallback onTap;

  UserTypeButton({required this.userType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: Color(0xFFFE5B2A),
          borderRadius: BorderRadius.circular(15.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromARGB(255, 243, 103, 61).withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Center(
          child: Text(
            userType,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}