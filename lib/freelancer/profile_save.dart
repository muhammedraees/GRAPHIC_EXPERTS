// another page 
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'profile_create.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('usersprofile').get();
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          userData = snapshot.docs.first.data() as Map<String, dynamic>;
        });
      }
    } catch (e) {
      // print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => SendOrUpdateData(
                    username: userData['username'] ?? '',
                    jobType: userData['jobType'] ?? '',
                    experience: userData['experience'] ?? '',
                    skills: userData['skills'] ?? '',
                    link: userData['link'] ?? '',
                    imagePath: userData['profile'] ?? '',
                    id: userData['id'] ?? '',
                  ),
                ),
              )
                  .then((_) {
                fetchUserData();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  // handle profile image
                },
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 80,
                    child: userData['profile'] != null &&
                            userData['profile'].isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.network(
                              userData['profile'],
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              'assets/images/unknown_profile.jpg',
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Text(
              'Username    :  ${userData['username'] ?? ''}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Job Type      :  ${userData['jobType'] ?? ''}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Experience   :  ${userData['experience'] ?? ''}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Skills             :  ${userData['skills'] ?? ''}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Link               :  ${userData['link'] ?? ''}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// another code not working
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// import 'profile_create.dart';
// // import 'package:profile_app/send_or_update_data.dart';

// // import 'profile_test.dart'; // Import SendOrUpdateData

// class ProfileEdit extends StatefulWidget {
//   // ... Existing code ...

//   @override
//   State<ProfileEdit> createState() => _ProfileEditState();
// }

// class _ProfileEditState extends State<ProfileEdit> {
//   Map<String, dynamic> userData = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       final snapshot =
//           await FirebaseFirestore.instance.collection('users').get();
//       if (snapshot.docs.isNotEmpty) {
//         setState(() {
//           userData = snapshot.docs.first.data() as Map<String, dynamic>;
//         });
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               Navigator.of(context)
//                   .push(
//                 MaterialPageRoute(
//                   builder: (context) => SendOrUpdateData(
//                     username: userData['username'] ?? '',
//                     jobType: userData['jobType'] ?? '',
//                     experience: userData['experience'] ?? '',
//                     skills: userData['skills'] ?? '',
//                     link: userData['link'] ?? '',
//                     imagePath: userData['profile'] ?? '',
//                     id: userData['id'] ?? '',
//                   ),
//                 ),
//               )
//                   .then((_) {
//                 fetchUserData();
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   // Handle profile image
//                 },
//                 child: Center(
//                   child: CircleAvatar(
//                     backgroundColor: Colors.grey,
//                     radius: 80,
//                     child: userData['profile'] != null &&
//                         userData['profile'].isNotEmpty
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(80),
//                             child: Image.network(
//                               userData['profile'],
//                               width: 160,
//                               height: 160,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                         : ClipRRect(
//                             borderRadius: BorderRadius.circular(80),
//                             child: Image.asset(
//                               'assets/images/unknown_profile.jpg',
//                               width: 160,
//                               height: 160,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 100),
//             Text(
//               'Username    :  ${userData['username'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Job Type      :  ${userData['jobType'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Experience   :  ${userData['experience'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Skills             :  ${userData['skills'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Link               :  ${userData['link'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// latest code with few bugs 
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'profile_create.dart'; 

// class ProfileEdit extends StatefulWidget {
//   ProfileEdit({Key? key}) : super(key: key);

//   @override
//   State<ProfileEdit> createState() => _ProfileEditState();
// }

// class _ProfileEditState extends State<ProfileEdit> {
//   Map<String, dynamic> userData = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       final snapshot =
//           await FirebaseFirestore.instance.collection('users').get();
//       if (snapshot.docs.isNotEmpty) {
//         setState(() {
//           userData = snapshot.docs.first.data() as Map<String, dynamic>;
//         });
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text('Profile'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () {
//               Navigator.of(context)
//                   .push(
//                 MaterialPageRoute(
//                   builder: (context) => SendOrUpdateData(
//                     username: userData['username'] ?? '',
//                     jobType: userData['jobType'] ?? '',
//                     experience: userData['experience'] ?? '',
//                     skills: userData['skills'] ?? '',
//                     link: userData['link'] ?? '',
//                     imagePath: userData['profile'] ?? '',
//                     id: userData['id'] ?? '',
//                   ),
//                 ),
//               )
//                   .then((_) {
//                 fetchUserData();
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: InkWell(
//                 onTap: () {
//                   // Handle profile image
//                 },
//                 child: userData['profile'] != null && userData['profile'].isNotEmpty
//                     ? CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         radius: 80,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(80),
//                           child: Image.network(
//                             userData['profile'], // Display profile image from Firebase Storage
//                             width: 160,
//                             height: 160,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       )
//                     : CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         radius: 80,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(80),
//                           child: Image.asset(
//                             'assets/images/unknown_profile.jpg',
//                             width: 160,
//                             height: 160,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//               ),
//             ),
//             const SizedBox(height: 100),
//             Text(
//               'Username    :  ${userData['username'] ?? ''}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               'Job Type      :  ${userData['jobType'] ?? ''}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               'Experience   :  ${userData['experience'] ?? ''}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               'Skills             :  ${userData['skills'] ?? ''}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               'Link               :  ${userData['link'] ?? ''}',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
