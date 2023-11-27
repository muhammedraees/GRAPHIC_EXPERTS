import 'package:flutter/material.dart';
import '../chat/pages/home_page.dart';
import '../client_post_new/home_post_cli.dart';
import '../freelancer/home_page.dart';
import '../freelancer/search_page.dart';
import 'settings_page.dart';

class FreelancerBottomNav extends StatefulWidget {
  @override
  _FreelancerBottomNavState createState() => _FreelancerBottomNavState();
}
class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  CustomNavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 60.0,
        width: 60.0,
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
class _FreelancerBottomNavState extends State<FreelancerBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    PostListHome(),
    const ChatHomePage(),
    const SettingsPage(),

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



