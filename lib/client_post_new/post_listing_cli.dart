// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'create_post_cli.dart';
// import 'post_model_cli.dart';

// class UserPostsPage extends StatefulWidget {
//   @override
//   _UserPostsPageState createState() => _UserPostsPageState();
// }

// class _UserPostsPageState extends State<UserPostsPage> {
//   final User? user = FirebaseAuth.instance.currentUser;

//   Future<List<Post>> _getUserPosts() async {
//     final QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('posts')
//         .where('userId', isEqualTo: user?.uid)
//         .get();
//     return snapshot.docs.map((doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       return Post(
//         userId: data['userId'],
//         image: data['image'],
//         caption: data['caption'],
//         userEmail: '', postId: '',
//       );
//     }).toList();
//   }

//   void _navigateToCreatePostPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CreatePostPage(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text('Your Posts'),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: (Color(0xFFFE5B2A)),
//             )),
//       ),
//       body: FutureBuilder<List<Post>>(
//         future: _getUserPosts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final List<Post> userPosts = snapshot.data!;
//             return ListView.builder(
//               itemCount: userPosts.length,
//               itemBuilder: (context, index) {
//                 final post = userPosts[index];
//                 return Container(
//                   padding: const EdgeInsets.all(16.0),
//                   // decoration: BoxDecoration(
//                   //   border: Border.all(color: Colors.grey),
//                   //   borderRadius: BorderRadius.circular(8.0),
//                   // ),
//                   margin: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         post.caption,
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           // fontWeight: FontWeight.bold,
//                           color: Colors.white
//                         ),
//                       ),
//                       const SizedBox(height: 8.0),
//                       Image.network(post.image),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFFFE5B2A),
//        onPressed: () {
//           _navigateToCreatePostPage(context);
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'create_post_cli.dart';
import 'post_details.dart';
import 'post_model_cli.dart';
// import 'post_detail_page.dart'; // Import your post detail page

class UserPostsPage extends StatefulWidget {
  @override
  _UserPostsPageState createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  final User? user = FirebaseAuth.instance.currentUser;

  Future<List<Post>> _getUserPosts() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('posts')
        .where('userId', isEqualTo: user?.uid)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Post(
        userId: data['userId'],
        image: data['image'],
        caption: data['caption'],
        userEmail: '',
        postId: '',
      );
    }).toList();
  }

  void _navigateToCreatePostPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePostPage(),
      ),
    );
  }

  void _navigateToPostDetailPage(BuildContext context, Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailsPage(post: post), // Replace with your post detail page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Your Posts'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: (Color(0xFFFE5B2A)),
          ),
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: _getUserPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Post> userPosts = snapshot.data!;
            return ListView.builder(
              itemCount: userPosts.length,
              itemBuilder: (context, index) {
                final post = userPosts[index];
                return GestureDetector(
                  onTap: () {
                    _navigateToPostDetailPage(context, post);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.caption,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Image.network(post.image),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFE5B2A),
        onPressed: () {
          _navigateToCreatePostPage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
