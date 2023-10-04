// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
// // import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
// // import 'package:flutter_firebase/features/user_auth/presentation/widgets/form_container_widget.dart';

// import '../../firebase_auth_implementation/firebase_auth_services.dart';
// import '../widgets/form_container_widget.dart';
// import 'login_page.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final FirebaseAuthService _auth = FirebaseAuthService();

//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("SignUp"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Sign Up",
//                 style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               FormContainerWidget(
//                 controller: _usernameController,
//                 hintText: "Username",
//                 isPasswordField: false,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               FormContainerWidget(
//                 controller: _emailController,
//                 hintText: "Email",
//                 isPasswordField: false,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               FormContainerWidget(
//                 controller: _passwordController,
//                 hintText: "Password",
//                 isPasswordField: true,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               GestureDetector(
//                 onTap: _signUp,
//                 child: Container(
//                   width: double.infinity,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                       child: Text(
//                     "Sign Up",
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already have an account?"),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()),
//                             (route) => false);
//                       },
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.bold),
//                       ))
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _signUp() async {
//     String username = _usernameController.text;
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     User? user = await _auth.signUpWithEmailAndPassword(email, password);

//     if (user != null) {
//       print("User is successfully created");
//       Navigator.pushNamed(context, "/home");
//     } else {
//       print("Some error happend");
//     }
//   }
// }




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';
import '../widgets/form_container_widget.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      // appBar: AppBar(
      //   title: Text("Sign Up"),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(color: Colors.white,fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE5B2A), // Changed color to orange
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFFFE5B2A), // Changed color to orange
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

    void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      print("Some error happend");
    }
  }
}

