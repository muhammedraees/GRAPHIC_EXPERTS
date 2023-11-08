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

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? selectedJobType;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
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
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

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
//           }).where((profile) {
//             return selectedJobType == null ||
//                 selectedJobType!.isEmpty ||
//                 profile.jobType == selectedJobType ||
//                 selectedJobType == 'All';
//           }).toList();

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: DropdownButton<String>(
//                   value: selectedJobType,
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedJobType = newValue;
//                     });
//                   },
//                   items: <String>[
//                     'All',
//                     'Designer',
//                     'Developer',
//                     'Digital Marketing'
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: profiles.length,
//                   itemBuilder: (context, index) {
//                     final profile = profiles[index];
//                     return Card(
//                       color: Color.fromARGB(255, 45, 45, 45),
//                       elevation: 2,
//                       margin: EdgeInsets.all(16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: NetworkImage(profile.profileImageURL),
//                               radius: 50,
//                             ),
//                             SizedBox(height: 16),
//                             Text(
//                               'Username: ${profile.username}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Job Type: ${profile.jobType}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Experience: ${profile.experience}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Skills: ${profile.skills}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Link: ${profile.link}',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16,
//                                 // decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Expanded(
//               //   child: ListView.builder(
//               //     itemCount: (profiles.length / 2)
//               //         .ceil(), // Divide the profiles into pairs
//               //     itemBuilder: (context, index) {
//               //       final startIndex =
//               //           index * 2; // Start index for the pair of cards
//               //       final endIndex = startIndex +
//               //           2; // End index for the pair of cards (or less if it's the last pair)

//               //       // Create a sublist of profiles for this pair of cards
//               //       final pairProfiles = profiles.sublist(startIndex, endIndex);

//               //       return Row(
//               //         children: pairProfiles.map((profile) {
//               //           return Expanded(
//               //             child: Card(
//               //               color: const Color.fromARGB(255, 45, 45, 45),
//               //               elevation: 2,
//               //               margin: const EdgeInsets.all(16),
//               //               child: Padding(
//               //                 padding: const EdgeInsets.all(16),
//               //                 child: Column(
//               //                   children: [
//               //                     CircleAvatar(
//               //                       backgroundImage:
//               //                           NetworkImage(profile.profileImageURL),
//               //                       radius: 50,
//               //                     ),
//               //                     const SizedBox(height: 16),
//               //                     Text(
//               //                       '${profile.username}',
//               //                       style: const TextStyle(
//               //                         color: Colors.white,
//               //                         fontSize: 18,
//               //                         fontWeight: FontWeight.bold,
//               //                       ),
//               //                     ),
//               //                     const SizedBox(height: 8),
//               //                     Text(
//               //                       '${profile.jobType}',
//               //                       style: const TextStyle(
//               //                         color: Colors.white,
//               //                         fontSize: 16,
//               //                       ),
//               //                     ),
//               //                     const SizedBox(height: 8),
//               //                     Text(
//               //                       '${profile.experience}',
//               //                       style: const TextStyle(
//               //                         color: Colors.white,
//               //                         fontSize: 16,
//               //                       ),
//               //                     ),
//               //                     const SizedBox(height: 8),
//               //                     Text(
//               //                       '${profile.skills}',
//               //                       style: const TextStyle(
//               //                         color: Colors.white,
//               //                         fontSize: 16,
//               //                       ),
//               //                     ),
//               //                     const SizedBox(height: 8),
//               //                     Text(
//               //                       '${profile.link}',
//               //                       style: const TextStyle(
//               //                         color: Colors.blue,
//               //                         fontSize: 16,
//               //                         // decoration: TextDecoration.underline,
//               //                       ),
//               //                     ),
//               //                   ],
//               //                 ),
//               //               ),
//               //             ),
//               //           );
//               //         }).toList(),
//               //       );
//               //     },
//               //   ),
//               // ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

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

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? selectedJobType;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
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
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
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
//           }).where((profile) {
//             return selectedJobType == null ||
//                 selectedJobType!.isEmpty ||
//                 profile.jobType == selectedJobType ||
//                 selectedJobType == 'All';
//           }).toList();
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: DropdownButton<String>(
//                   value: selectedJobType,
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedJobType = newValue;
//                     });
//                   },
//                   items: <String>[
//                     'All',
//                     'Designer',
//                     'Developer',
//                     'Digital Marketing',
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(

//                   itemCount: profiles.length,
//                   itemBuilder: (context, index) {
//                     final profile = profiles[index];
//                     return Card(
//                       color: const Color.fromARGB(255, 45, 45, 45),
//                       elevation: 2,
//                       margin: const EdgeInsets.all(16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: NetworkImage(profile.profileImageURL != null
//                                   ? profile.profileImageURL
//                                   : 'assets/images/unknown_profile.jpg'),
//                               radius: 50,
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'Username: ${profile.username}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Job Type: ${profile.jobType}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Experience: ${profile.experience}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Skills: ${profile.skills}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Link: ${profile.link}',
//                               style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16,
//                                 // decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

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

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String? selectedJobType;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
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
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

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

//           // Apply filtering based on selectedJobType
//           final filteredProfiles = profiles.where((profile) {
//             if (selectedJobType == null || selectedJobType!.isEmpty) {
//               return true; // No filter applied, so show all profiles.
//             } else if (selectedJobType == 'All') {
//               return true; // 'All' selected, so show all profiles.
//             } else {
//               return profile.jobType == selectedJobType;
//             }
//           }).toList();

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: DropdownButton<String>(
//                   value: selectedJobType,
//                   onChanged: (newValue) {
//                     setState(() {
//                       selectedJobType = newValue;
//                     });
//                   },
//                   items: <String>[
//                     'All',
//                     'Designer',
//                     'Developer',
//                     'Digital Marketing',
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: filteredProfiles.length, // Use the filtered list
//                   itemBuilder: (context, index) {
//                     final profile = filteredProfiles[index]; // Use the filtered profile
//                     return Card(
//                       color: const Color.fromARGB(255, 45, 45, 45),
//                       elevation: 2,
//                       margin: const EdgeInsets.all(16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: NetworkImage(profile.profileImageURL != null
//                                   ? profile.profileImageURL
//                                   : 'assets/images/unknown_profile.jpg'),
//                               radius: 50,
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'Username: ${profile.username}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Job Type: ${profile.jobType}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Experience: ${profile.experience}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Skills: ${profile.skills}',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Link: ${profile.link}',
//                               style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16,
//                                 // decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'profile_full_view.dart';

class UserProfile {
  final String username;
  final String jobType;
  final String experience;
  final String skills;
  final String link;
  final String profileImageURL;

  UserProfile({
    required this.username,
    required this.jobType,
    required this.experience,
    required this.skills,
    required this.link,
    required this.profileImageURL,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedJobType;
  List<UserProfile> profiles = [];

  @override
  void initState() {
    super.initState();
    fetchUserProfiles();
  }

  // void fetchUserProfiles() async {
  //   final snapshot = await FirebaseFirestore.instance.collection('users').get();
  //   if (snapshot.docs.isNotEmpty) {
  //     profiles = snapshot.docs.map((doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       return UserProfile(
  //         username: data['username'],
  //         jobType: data['jobType'],
  //         experience: data['experience'],
  //         skills: data['skills'],
  //         link: data['link'],
  //         profileImageURL: data['profile'],
  //       );
  //     }).toList();
  //     setState(() {});
  //   }
  // }
  void fetchUserProfiles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('usersprofile').get();
    if (snapshot.docs.isNotEmpty) {
      profiles = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserProfile(
          username:
              data['username'] ?? '', // Handle null value with an empty string
          jobType:
              data['jobType'] ?? '', // Handle null value with an empty string
          experience: data['experience'] ??
              '', // Handle null value with an empty string
          skills:
              data['skills'] ?? '', // Handle null value with an empty string
          link: data['link'] ?? '', // Handle null value with an empty string
          profileImageURL:
              data['profile'] ?? '', // Handle null value with an empty string
        );
      }).toList();
      setState(() {});
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
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: buildHomePage(),
    );
  }

  Widget buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButton<String>(
            value: selectedJobType,
            onChanged: (newValue) {
              setState(() {
                selectedJobType = newValue;
              });
            },
            items: getJobTypeDropdownItems(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: (filteredProfiles.length / 2).ceil(),
            itemBuilder: (context, index) {
              final startIdx = index * 2;
              final endIdx = startIdx + 2;

              return Row(
                children: [
                  for (var i = startIdx; i < endIdx; i++)
                    if (i < filteredProfiles.length)
                      Expanded(
                        flex: 1, // Equal width for both profiles
                        child: GestureDetector(
                          onTap: () {
                            showProfileDialog(context, filteredProfiles[i]);
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 45, 45, 45),
                            elevation: 2,
                            margin: const EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  // CircleAvatar(
                                  //   backgroundImage: NetworkImage(
                                  //     filteredProfiles[i].profileImageURL != null
                                  //         ? filteredProfiles[i].profileImageURL
                                  //         : 'assets/images/unknown_profile.jpg',
                                  //   ),
                                  //   radius: 50,
                                  // ),
                                  Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          filteredProfiles[i].profileImageURL !=
                                                  null
                                              ? filteredProfiles[i]
                                                  .profileImageURL
                                              : 'assets/images/unknown_profile.jpg',
                                        ),
                                        radius: 50,
                                      ),
                                      if (filteredProfiles[i].profileImageURL ==
                                          null)
                                        Container(
                                          width:
                                              100, // Adjust the width and height as needed
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors
                                                .transparent, // Set the background color to transparent
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/unknown_profile.jpg',
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '${filteredProfiles[i].username}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    filteredProfiles[i].jobType,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    filteredProfiles[i].experience,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    filteredProfiles[i].skills,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    filteredProfiles[i].link,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getJobTypeDropdownItems() {
    final jobTypes = ['All', 'Designer', 'Developer', 'Digital Marketing'];
    return jobTypes.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  List<UserProfile> get filteredProfiles {
    if (selectedJobType == null || selectedJobType == 'All') {
      return profiles;
    } else {
      return profiles
          .where((profile) => profile.jobType == selectedJobType)
          .toList();
    }
  }

  void showProfileDialog(BuildContext context, UserProfile profile) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: FullProfileDialog(profile: profile),
        );
      },
    );
  }
}

