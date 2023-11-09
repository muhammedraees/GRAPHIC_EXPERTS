// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'chat_req.dart';
// import 'post_model_cli.dart';

// class PostListHome extends StatefulWidget {
//   @override
//   _PostListHomeState createState() => _PostListHomeState();
// }

// class _PostListHomeState extends State<PostListHome> {
//   Future<List<Post>> _getAllPosts() async {
//     try {
//       final QuerySnapshot snapshot =
//           await FirebaseFirestore.instance.collection('posts').get();
//       return snapshot.docs.map((doc) {
//         final data = doc.data() as Map<String, dynamic>;
//         if (data.containsKey('userId') &&
//             data.containsKey('image') &&
//             data.containsKey('caption')) {
//           return Post(
//             userId: data['userId'],
//             image: data['image'],
//             caption: data['caption'],
//             userEmail: '',
//           );
//         }
//         // Handle missing fields in the document as needed
//         return Post(userId: '', image: '', caption: '', userEmail: '');
//       }).toList();
//     } catch (e) {
//       print('Error fetching posts: $e');
//       return []; // Return an empty list in case of an error
//     }
//   }

//   void _showRequestDialog(BuildContext context, Post post) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//           title: const Text('Request Post',style: TextStyle(
//                           color: Colors.white), ),
//           content: const Text('Do you want to request this post ?',style: TextStyle(
//                           color: Colors.white), ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 // Handle the request logic here
//                 // You can add your request handling code

//                 // Replace the following lines with your chat page navigation logic.
//                 // You should navigate to the chat page with the receiver's information.
//                 Navigator.of(context).pop(); // Close the dialog.
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ChatRequestPage(
//                       receiverUserId: post.userId, // Receiver's user ID
//                       receiverUserEmail: post.userEmail, // Receiver's email
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('Request',style: TextStyle(
//                               color: Color(
//                                   0xFFFE5B2A)),),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel',style: TextStyle(
//                               color: Colors
//                                   .grey), ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       // appBar: AppBar(
//       //   title: const Text('Home'),
//       // ),
//       body: FutureBuilder<List<Post>>(
//         future: _getAllPosts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final List<Post> posts = snapshot.data!;
//             return ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 final post = posts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     _showRequestDialog(context, post);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(
//                         bottom: 16.0), // Add margin to create spacing
//                     child: ListTile(
//                       title: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             post.caption,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           const SizedBox(
//                               height: 8), // Adjust the spacing as needed
//                         ],
//                       ),
//                       subtitle: Image.network(post.image),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }




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
            caption: data['caption'],
            userEmail: '',
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
          backgroundColor: const Color.fromARGB(255, 32, 32, 31),
          title: const Text('Request Post', style: TextStyle(color: Colors.white),),
          content: const Text('Do you want to request this post ?', style: TextStyle(color: Colors.white),),
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
              child: const Text('Request', style: TextStyle(color: Color(0xFFFE5B2A)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      body: FutureBuilder<List<Post>>(
        future: _getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Center the CircularProgressIndicator when loading.
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Post> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    _showRequestDialog(context, post);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        bottom: 16.0), // Add margin to create spacing
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.caption,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                              height: 8), // Adjust the spacing as needed
                        ],
                      ),
                      subtitle: Image.network(post.image),
                    ),
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
