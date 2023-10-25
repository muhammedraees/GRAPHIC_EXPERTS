// import 'package:flutter/material.dart';

// import 'home_page.dart';

// import 'search_page.dart';


// class UserProfileDetails extends StatelessWidget {
//   final UserProfile profile;
  

//   UserProfileDetails({required this.profile});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage(profile.profileImageURL),
//                 radius: 80,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Username: ${profile.username}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Job Type: ${profile.jobType}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Experience: ${profile.experience}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Skills: ${profile.skills}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Link: ${profile.link}',
//               style: const TextStyle(fontSize: 20),
//             ),
//             // Add more fields as needed
//           ],
//         ),
//       ),
//     );
//   }
// }



// class ProfileDetailsPage extends StatelessWidget {
//   final UserProfile profile;

//   ProfileDetailsPage({required this.profile});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Details'),
//       ),
//       body: Column(
//         children: [
//           // Display all the profile details here
//           ListTile(
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(profile.profileImageURL),
//             ),
//             title: Text('Username: ${profile.username}'),
//             subtitle: Text('Job Type: ${profile.jobType}'),
//           ),
//           // Add more ListTile widgets to display other details (experience, skills, link, etc.)
//         ],
//       ),
//     );
//   }
// }
