// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// // import 'freelancer/profile_details.dart';
// // import 'freelancer/profile_editing.dart';
// import 'screens/onboarding.dart';
// // import 'select_user.dart';

// Future<void> main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // primarySwatch: Colors.blue,
//         textSelectionTheme: TextSelectionThemeData(
//           cursorColor:  (Color(0xFFFE5B2A)), // Change cursor color here
//           // selectionColor: Colors.green, // (Optional) Change text selection color here
//           // selectionHandleColor: Colors.orange, // (Optional) Change selection handle color here
//         ),
//       ),
//       home: OnboardingPage(),
//     );
//   }
// }



// last one 3-11-2023
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'auth_steps/user_auth/presentation/pages/login_page.dart';
// import 'auth_steps/user_auth/presentation/pages/sign_up_page.dart';
// import 'screens/freelancerbottomvav.dart';
// import 'screens/onboarding.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyCsHDQtI9DItQgSqwy45_y2xG9tDGxuER8",
//         appId: "1:540215271818:web:8b22d4aee01acdce862873",
//         messagingSenderId: "540215271818",
//         projectId: "flutter-firebase-9c136",
//         // Your web Firebase config options
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Firebase',
//       theme: ThemeData(
//         textSelectionTheme: const TextSelectionThemeData(
//           cursorColor: (Color(0xFFFE5B2A)),
//         ),
//       ),
//       routes: {
//         '/': (context) => OnboardingPage(
//               // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
//               // child: LoginPage(),
//             ),
//         '/login': (context) => LoginPage(),
//         '/signUp': (context) => SignUpPage(),
//         '/home': (context) => FreelancerBottomNav(),
//       },
//     );
//   }
// }


// chat
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:sampl_rest/add_image2.dart/firebase_options2.dart';
// import 'package:sampl_rest/chat/services/auth/auth_gate.dart';
// import 'package:sampl_rest/chat/services/auth/auth_service.dart';

import 'chat/services/auth/auth_gate.dart';
import 'chat/services/auth/auth_service.dart';
import 'screens/select_user.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey, // Set the primary color to grey.
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: (Color(0xFFFE5B2A)),
        ),
      ),
      home: UserTypeSelectionPage(),
    );
  }
}
