import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_req.dart';
import 'post_model_cli.dart';

class PostListHome extends StatefulWidget {
  @override
  _PostListHomeState createState() => _PostListHomeState();
}

class _PostListHomeState extends State<PostListHome> {
  Future<List<Post>> _getAllPosts() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('posts').get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('userId') &&
            data.containsKey('image') &&
            data.containsKey('caption')) {
          return Post(
            userId: data['userId'],
            image: data['image'],
            caption: data['caption'], userEmail: '',
          );
        }
        // Handle missing fields in the document as needed
        return Post(userId: '', image: '', caption: '', userEmail: '');
      }).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      return []; // Return an empty list in case of an error
    }
  }

void _showRequestDialog(BuildContext context, Post post) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Request Post'),
        content: const Text('Do you want to request this post?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Handle the request logic here
              // You can add your request handling code

              // Replace the following lines with your chat page navigation logic.
              // You should navigate to the chat page with the receiver's information.
              Navigator.of(context).pop(); // Close the dialog.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRequestPage(
                    receiverUserId: post.userId, // Receiver's user ID
                    receiverUserEmail: post.userEmail, // Receiver's email
                  ),
                ),
              );
            },
            child: const Text('Request'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Post> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector( // Wrap with GestureDetector to handle taps
                  onTap: () {
                    _showRequestDialog(context, post); // Show the dialog when post is tapped
                  },
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.caption),
                        const SizedBox(height: 8), // Adjust the spacing as needed
                      ],
                    ),
                    subtitle: Image.network(post.image),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}





// mail not showing 8-11-2023
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'post_model_cli.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Future<List<Post>> _getAllPosts() async {
//     try {
//       final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('posts').get();
//       return snapshot.docs.map((doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         if (data.containsKey('userId') &&
//             data.containsKey('image') &&
//             data.containsKey('caption')) {
//           return Post(
//             userId: data['userId'],
//             image: data['image'],
//             caption: data['caption'], userEmail: '',
//           );
//         }
//         // Handle missing fields in the document as needed
//         return Post(userId: '', image: '', caption: '', userEmail: '');
//       }).toList();
//     } catch (e) {
//       print('Error fetching posts: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: 
//       // FutureBuilder<List<Post>>(
//       //   future: _getAllPosts(),
//       //   builder: (context, snapshot) {
//       //     if (snapshot.connectionState == ConnectionState.waiting) {
//       //       return CircularProgressIndicator();
//       //     } else if (snapshot.hasError) {
//       //       return Text('Error: ${snapshot.error}');
//       //     } else {
//       //       final List<Post> posts = snapshot.data!;
//       //       return ListView.builder(
//       //         itemCount: posts.length,
//       //         itemBuilder: (context, index) {
//       //           final post = posts[index];
//       //           return ListTile(
//       //             title: Text(post.caption),
//       //             subtitle: Text('User Email: ${post.userEmail}'),
//       //             leading: Image.network(post.image),
//       //           );
//       //         },
//       //       );
//       //     }
//       //   },
//       // ),
//       FutureBuilder<List<Post>>(
//   future: _getAllPosts(),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       final List<Post> posts = snapshot.data!;
//       return ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           final post = posts[index];
//           return ListTile(
//             title: Text(post.caption),
//             subtitle: Text('User Email: ${post.userEmail}'), // Display the user's email
//             leading: Image.network(post.image),
//           );
//         },
//       );
//     }
//   },
// )

//     );
//   }
// }
