import 'package:flutter/material.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Search Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(), 
            Expanded(
              child: SearchResultList(), 
            ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}

class SearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: Text('Search results will appear here.'),
    );
  }
}




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

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   String searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: Text('Search Page'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: (Color(0xFFFE5B2A)),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SearchField(
//               onSearch: (query) {
//                 setState(() {
//                   searchQuery = query;
//                 });
//               },
//             ),
//             Expanded(
//               child: SearchResultList(searchQuery: searchQuery),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchField extends StatelessWidget {
//   final void Function(String) onSearch;

//   SearchField({required this.onSearch});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: TextField(
//         onChanged: (query) {
//           onSearch(query);
//         },
//         decoration: InputDecoration(
//           hintText: 'Search...',
//           prefixIcon: Icon(Icons.search),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.all(16.0),
//         ),
//       ),
//     );
//   }
// }

// class SearchResultList extends StatelessWidget {
//   final String searchQuery;

//   SearchResultList({required this.searchQuery});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('users')
//           .where('username', isGreaterThanOrEqualTo: searchQuery)
//           .where('username', isLessThan: searchQuery + 'z')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('Error: ${snapshot.error}'),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(), // Loading indicator while fetching data
//           );
//         }

//         final profiles = snapshot.data!.docs.map((doc) {
//           final data = doc.data() as Map<String, dynamic>;
//           return UserProfile(
//             username: data['username'],
//             jobType: data['jobType'],
//             experience: data['experience'],
//             skills: data['skills'],
//             link: data['link'],
//             profileImageURL: data['profile'],
//           );
//         }).toList();

//         // Build the UI using the list of profiles
//         return ListView.builder(
//           itemCount: profiles.length,
//           itemBuilder: (context, index) {
//             final profile = profiles[index];
//             // Create a widget to display each user profile
//             return ListTile(
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(profile.profileImageURL),
//               ),
//               title: Text(profile.username),
//               subtitle: Text(profile.jobType),
//               // Add more fields as needed
//               onTap: () {
//                 // Navigate to the user's profile details page
//                Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => UserProfileDetails(profile: profile),
//                     ),
//                   );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class UserProfileDetails extends StatelessWidget {
//   final UserProfile profile;

//   UserProfileDetails({required this.profile});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 backgroundColor: Colors.grey,
//                 radius: 80,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(80),
//                   child: Image.network(
//                     profile.profileImageURL,
//                     width: 160,
//                     height: 160,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 100),
//             Text(
//               'Username    :  ${profile.username}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Job Type      :  ${profile.jobType}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Experience   :  ${profile.experience}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Skills             :  ${profile.skills}',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Link               :  ${profile.link}',
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
