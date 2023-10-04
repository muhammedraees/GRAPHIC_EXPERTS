// import 'package:flutter/material.dart';

// import 'freelancer/profile_details.dart';



// class MyBottomNavigationBar extends StatefulWidget {
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;
//   final List<Widget> _pages = [
//     HomeScreen(),
//     SearchScreen(),
//     ChatsScreen(),
//     // SettingsPage(),
//     ProfileDetailsPage()

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       // Remove the app bar
//       appBar: null,
//       body: _pages[_currentIndex],
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.all(14),
//         height: 80.0, // Increase the height here
//         decoration: BoxDecoration(
//           color: Color(0xFFFE5B2A), // Background color of the container
//           borderRadius: BorderRadius.circular(20.0)
//           // vertical(
//           //   top: Radius.circular(20.0), // Adjust the radius as needed
//           ),
        
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

// class CustomNavItem extends StatelessWidget {
//   final IconData icon;
//   final bool isSelected;
//   final Function onTap;

//   CustomNavItem({
//     required this.icon,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onTap();
//       },
//       child: Container(
//         padding: EdgeInsets.all(12),
//         height: 60.0, // Increase the height here
//         width: 60.0, // Increase the width to maintain a circular shape
//         // decoration: BoxDecoration(
//         //   shape: BoxShape.circle,
//         //   color: isSelected ? Colors.orange : Colors.transparent,
//         // ),
//         child: Icon(
//           icon,
//           color: isSelected ? Colors.black : Colors.white,
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Home Screen"),
//     );
//   }
// }

// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Search Screen"),
//     );
//   }
// }

// class ChatsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Chats Screen"),
//     );
//   }
// }




import 'package:flutter/material.dart';

// import '../freelancer/profile_details.dart';
import 'settings_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    ChatsScreen(),
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
        padding: EdgeInsets.all(12),
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Screen"),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search Screen"),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Chats Screen"),
    );
  }
}
