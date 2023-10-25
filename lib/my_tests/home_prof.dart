// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfile {
//   final String username;
//   final String jobType;
//   final String experience;
//   final String skills;
//   final String link;
//   final String profileImageURL;

//   UserProfile({
//     required this.username,
//     required this.jobType,
//     required this.experience,
//     required this.skills,
//     required this.link,
//     required this.profileImageURL,
//   });
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//           elevation: 0,
//           centerTitle: true,
//           title: const Text(
//             'Home',
//             style: TextStyle(fontWeight: FontWeight.w300),
//           ),
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('users').snapshots(),
//             // stream: null,
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Error: ${snapshot.error}'),
//                 );
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child:
//                       CircularProgressIndicator(), // Loading indicator while fetching data
//                 );
//               }
//               final profiles = snapshot.data!.docs.map((doc) {
//                 final data = doc.data() as Map<String, dynamic>;
//                 return UserProfile(
//                   username: data['username'],
//                   jobType: data['jobType'],
//                   experience: data['experience'],
//                   skills: data['skills'],
//                   link: data['link'],
//                   profileImageURL: data['profile'],
//                 );
//               }).toList();
//               return ListView.builder(
//                   itemCount: 2, // Display two profiles in each row
//                   itemBuilder: (context, index) {
//                     final startIndex = index * 2;
//                     final endIndex = startIndex + 1;

//                     return Row(
//                     children: [
//                       buildProfileCard(profiles[startIndex]),
//                       SizedBox(width: 16),
//                       if (endIndex < profiles.length)
//                         buildProfileCard(profiles[endIndex]),
//                     ],
//                   );
//                   });
//             }));
//   }

//   Widget buildProfileCard(UserProfile profile) {
//     return const Expanded(
//       child: Card(
//           color: Color.fromARGB(255, 45, 45, 45),
//           elevation: 2,
//           margin: EdgeInsets.all(16),
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(profile.profileImageURL),
//             radius: 50,
//                 ),
//                 SizedBox(height: 16),
//           Text(
//             'Username: ${profile.username}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Job Type: ${profile.jobType}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Experience: ${profile.experience}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Skills: ${profile.skills}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Link: ${profile.link}',
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 16,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//               ],
//             ),
//           )),
//     );
//   }
// }








// profile listing home page old 


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'profile_view.dart';

// class UserProfile {
//   final String username;
//   final String jobType;
//   final String experience;
//   final String skills;
//   final String link;
//   final String profileImageURL;

//   UserProfile({
//     required this.username,
//     required this.jobType,
//     required this.experience,
//     required this.skills,
//     required this.link,
//     required this.profileImageURL,
//   });
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'Home',
//           style: TextStyle(fontWeight: FontWeight.w300),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child:
//                   CircularProgressIndicator(), // Loading indicator while fetching data
//             );
//           }

//           // Extract user profiles from the snapshot
//           final profiles = snapshot.data!.docs.map((doc) {
//             final data = doc.data() as Map<String, dynamic>;
//             return UserProfile(
//               username: data['username'],
//               jobType: data['jobType'],
//               experience: data['experience'],
//               skills: data['skills'],
//               link: data['link'],
//               profileImageURL: data['profile'],
//             );
//           }).toList();

//           // Build the UI using the list of profiles and a GridView
//           return ListView.builder(
//             itemCount: profiles.length ~/ 2, // Display two profiles in each row
//             itemBuilder: (context, index) {
//               final startIndex = index * 2;
//               final endIndex = startIndex + 1;

//               return Card(
//                 color: Color.fromARGB(255, 45, 45, 45),
//                 elevation: 2,
//                 margin: EdgeInsets.all(16),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     children: [
//                       buildProfileCard(profiles[startIndex]),
//                       SizedBox(width: 16),
//                       if (endIndex < profiles.length)
//                         buildProfileCard(profiles[endIndex]),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget buildProfileCard(UserProfile profile) {
//     return Expanded(
//       child: Column(
//         children: [
//           CircleAvatar(
//             backgroundImage: NetworkImage(profile.profileImageURL),
//             radius: 50,
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Username: ${profile.username}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Job Type: ${profile.jobType}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Experience: ${profile.experience}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Skills: ${profile.skills}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             'Link: ${profile.link}',
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 16,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





