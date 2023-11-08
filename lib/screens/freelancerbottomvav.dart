import 'package:flutter/material.dart';

import '../chat/pages/home_page.dart';
// import '../freelancer/home_page.dart';
// import '../client/client_home_page.dart';
// import '../client/client_post_listing.dart';
import '../client_post_new/home_post_cli.dart';
// import '../client_post_new/post_listing_cli.dart';
import '../freelancer/home_page.dart';
import '../freelancer/search_page.dart';
import 'bottom_nav.dart';
// import '../freelancer/chat_page.dart';
// import '../freelancer/profile_details.dart';
// import '../freelancer/search_page.dart';
import 'settings_page.dart';

// class FreelancerBottomNav extends StatefulWidget {
//   @override
//   _FreelancerBottomNavState createState() => _FreelancerBottomNavState();
// }

// class _FreelancerBottomNavState extends State<FreelancerBottomNav> {
//   int _currentIndex = 0;
//   final List<Widget> _pages = [
//     HomePage(),
//     // SearchPage(),
//     PostListHome(),
//     ChatHomePage(),
//     const SettingsPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: null,
//       body: _pages[_currentIndex],
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.all(14),
//         height: 80.0,
//         decoration: BoxDecoration(
//           color: const Color(0xFFFE5B2A),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             CustomNavItem(
//               icon: Icons.home,
//               isSelected: _currentIndex == 0,
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//               },
//             ),
//             CustomNavItem(
//               icon: Icons.search,
//               isSelected: _currentIndex == 1,
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//               },
//             ),
//             CustomNavItem(
//               icon: Icons.chat,
//               isSelected: _currentIndex == 2,
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//               },
//             ),
//             CustomNavItem(
//               icon: Icons.settings,
//               isSelected: _currentIndex == 3,
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class FreelancerBottomNav extends StatefulWidget {
  @override
  _FreelancerBottomNavState createState() => _FreelancerBottomNavState();
}

class _FreelancerBottomNavState extends State<FreelancerBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    PostListHome(),
    ChatHomePage(),
    const SettingsPage(),
    // Add your new page here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: null,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(14),
        height: 80.0,
        decoration: BoxDecoration(
          color: const Color(0xFFFE5B2A),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavItem(
              icon: Icons.people,
              isSelected: _currentIndex == 0,
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            CustomNavItem(
              icon: Icons.search,
              isSelected: _currentIndex == 1,
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            CustomNavItem(
              icon: Icons.home,
              isSelected: _currentIndex == 2,
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            CustomNavItem(
              icon: Icons.chat,
              isSelected: _currentIndex == 3,
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
            // Add your new button here
            CustomNavItem(
              icon: Icons.settings,
              isSelected: _currentIndex == 4,
              onTap: () {
                setState(() {
                  _currentIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


// class FreelancerHomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text("Freelancer Home Screen"),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Text(''),
//     );
//   }
// }

class FreelancerSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Freelancer Search Screen"),
    );
  }
}

class FreelancerChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Freelancer Chats Screen"),
    );
  }
}
