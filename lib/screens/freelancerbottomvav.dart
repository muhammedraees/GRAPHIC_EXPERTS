import 'package:flutter/material.dart';

import 'bottom_nav.dart';
import '../freelancer/chat_page.dart';
import '../freelancer/home_page.dart';
// import '../freelancer/profile_details.dart';
import '../freelancer/search_page.dart';
import 'settings_page.dart';

class FreelancerBottomNav extends StatefulWidget {
  @override
  _FreelancerBottomNavState createState() => _FreelancerBottomNavState();
}

class _FreelancerBottomNavState extends State<FreelancerBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ChatListPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      appBar: null,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(14),
        height: 80.0,
        decoration: BoxDecoration(
          color: Color(0xFFFE5B2A),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavItem(
              icon: Icons.home,
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
              icon: Icons.chat,
              isSelected: _currentIndex == 2,
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            CustomNavItem(
              icon: Icons.settings,
              isSelected: _currentIndex == 3,
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FreelancerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Freelancer Home Screen"),
    );
  }
}

class FreelancerSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Freelancer Search Screen"),
    );
  }
}

class FreelancerChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Freelancer Chats Screen"),
    );
  }
}
