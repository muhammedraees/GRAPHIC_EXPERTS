// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'profile_test.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => SendOrUpdateData()),
//           );
//         },
//         backgroundColor: Colors.red.shade900,
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade900,
//         centerTitle: true,
//         title: Text(
//           'Home',
//           style: TextStyle(fontWeight: FontWeight.w300),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (
//           BuildContext context,
//           AsyncSnapshot<QuerySnapshot> streamSnapshot,
//         ) {
//           if (streamSnapshot.hasError) {
//             return Center(
//               child: Text("Error: ${streamSnapshot.error}"),
//             );
//           }

//           if (streamSnapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final docs = streamSnapshot.data?.docs;

//           if (docs == null || docs.isEmpty) {
//             return Center(
//               child: Text("No data available."),
//             );
//           }

//           return ListView.builder(
//             padding: EdgeInsets.symmetric(vertical: 41),
//             itemCount: docs.length,
//             itemBuilder: (context, index) {
//               final data = docs[index].data() as Map<String, dynamic>;

//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300,
//                       blurRadius: 5,
//                       spreadRadius: 1,
//                       offset: Offset(2, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.person,
//                           size: 31,
//                           color: Colors.red.shade300,
//                         ),
//                         SizedBox(width: 11),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               data['username'] ?? '',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               'Job Type: ${data['jobType'] ?? ''}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               'Experience: ${data['experience'] ?? ''}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               'Skills: ${data['skills'] ?? ''}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                             Text(
//                               'Link: ${data['link'] ?? ''}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w300,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => SendOrUpdateData(
//                                   username: data['username'] ?? '',
//                                   jobType: data['jobType'] ?? '',
//                                   experience: data['experience'] ?? '',
//                                   skills: data['skills'] ?? '',
//                                   link: data['link'] ?? '',
//                                   id: docs[index].id,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.blue,
//                             size: 21,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             final docData =
//                                 FirebaseFirestore.instance.collection('users').doc(docs[index].id);
//                             await docData.delete();
//                           },
//                           child: Icon(
//                             Icons.delete,
//                             color: Colors.red.shade900,
//                             size: 21,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'profile_test.dart'; // Import your SendOrUpdateData widget here

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Map<String, dynamic> userData = {};

//   @override
//   void initState() {
//     super.initState();
//     // Fetch and set the user's data when the widget initializes
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
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade900,
//         centerTitle: true,
//         title: Text(
//           'Profile',
//           style: TextStyle(fontWeight: FontWeight.w300),
//         ),
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
//                     imagePath: userData['imagePath'] ??
//                         '', // Provide imagePath with a default value
//                     // Add your user's ID here
//                   ),
//                 ),
//               )
//                   .then((_) {
//                 // Refresh user data after editing
//                 fetchUserData();
//               });
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display the user's profile image if imagePath is available
//             if (userData['imagePath'] != null &&
//                 userData['imagePath'].isNotEmpty)
//               Container(
//                 width: 160,
//                 height: 160,
//                 color: Colors.grey, // Set a background color
//                 child: Image.network(
//                   userData['imagePath'],
//                   width: 160,
//                   height: 160,
//                   fit: BoxFit.cover,
//                 ),
//               ),

//             Text(
//               'Username: ${userData['username'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               'Job Type: ${userData['jobType'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             Text(
//               'Experience: ${userData['experience'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             Text(
//               'Skills: ${userData['skills'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             Text(
//               'Link: ${userData['link'] ?? ''}',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'profile_test.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').get();
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          userData = snapshot.docs.first.data() as Map<String, dynamic>;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
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
        padding: EdgeInsets.all(16),
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
            SizedBox(height: 100),
            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: 'Username: ',
            //         style: TextStyle(
            //           // fontSize: 20,
            //           // fontWeight: FontWeight.w300,
            //           color: Colors.grey,
            //         ),
            //       ),
            //       TextSpan(
            //         text: userData['username'] ?? '',
            //         style: TextStyle(
            //           fontSize: 20, // Adjust the size as needed
            //           fontWeight:
            //               FontWeight.bold, // Adjust the weight as needed
            //           color: Colors.white, // Adjust the color as needed
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Text(
              'Username    :  ${userData['username'] ?? ''}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Job Type      :  ${userData['jobType'] ?? ''}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Experience   :  ${userData['experience'] ?? ''}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Skills             :  ${userData['skills'] ?? ''}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Link               :  ${userData['link'] ?? ''}',
              style: TextStyle(
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
