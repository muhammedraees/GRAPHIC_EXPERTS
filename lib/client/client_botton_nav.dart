import 'package:flutter/material.dart';

import '../screens/bottom_nav.dart';
import 'client_home_page.dart';

// import 'bottom_nav.dart';
// import '../client/client_home_page.dart'; // Replace with the actual client home page file.
// import '../client/client_search_page.dart'; // Replace with the actual client search page file.
// import '../client/client_chat_page.dart'; // Replace with the actual client chat page file.
// import 'client_settings_page.dart'; // Replace with the actual client settings page file.

class ClientBottomNav extends StatefulWidget {
  @override
  _ClientBottomNavState createState() => _ClientBottomNavState();
}

class _ClientBottomNavState extends State<ClientBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ClientHomeScreen(),
    ClientSearchScreen(),
    ClientChatsScreen(),
    ClientSettingsScreen(),
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



class ClientSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Client Search Screen"),
    );
  }
}

class ClientChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Client Chats Screen"),
    );
  }
}


class ClientSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Client Settings Screen"),
    );
  }
}