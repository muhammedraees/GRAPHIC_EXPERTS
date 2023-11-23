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



// before state 
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:graphic_experts/client_post_new/post_req.dart';

// // import 'chat_req.dart';
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
//             userEmail: '', postId: '',
//           );
//         }
//         // Handle missing fields in the document as needed
//         return Post(userId: '', image: '', caption: '', userEmail: '', postId: '');
//       }).toList();
//     } catch (e) {
//       print('Error fetching posts: $e');
//       return []; // Return an empty list in case of an error
//     }
//   }

//   // void _showRequestDialog(BuildContext context, Post post) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//   //         title: const Text('Request Post', style: TextStyle(color: Colors.white),),
//   //         content: const Text('Do you want to request this post ?', style: TextStyle(color: Colors.white),),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             onPressed: () {
//   //               // Handle the request logic here
//   //               // You can add your request handling code

//   //               // Replace the following lines with your chat page navigation logic.
//   //               // You should navigate to the chat page with the receiver's information.
//   //               Navigator.of(context).pop(); // Close the dialog.
//   //               Navigator.push(
//   //                 context,
//   //                 MaterialPageRoute(
//   //                   builder: (context) => ChatRequestPage(
//   //                     receiverUserId: post.userId, // Receiver's user ID
//   //                     receiverUserEmail: post.userEmail, // Receiver's email
//   //                   ),
//   //                 ),
//   //               );
//   //             },
//   //             child: const Text('Request', style: TextStyle(color: Color(0xFFFE5B2A)),),
//   //           ),
//   //           TextButton(
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //             child: const Text('Cancel', style: TextStyle(color: Colors.grey),),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }


//   void _showRequestDialog(BuildContext context, Post post) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         title: const Text('Request Post', style: TextStyle(color: Colors.white),),
//         content: const Text('Do you want to request this post ?', style: TextStyle(color: Colors.white),),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () async {
//               // Handle the request logic here
//               // You can add your request handling code

//               // Replace the following line with your post requests page navigation logic.
//               // You should navigate to the post requests page with the post information.
//               Navigator.of(context).pop(); // Close the dialog.
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PostRequestsPage(post: post),
//                 ),
//               );

//               // After returning from PostRequestsPage, you can add additional logic if needed.
//               // For example, you might want to update the UI based on the result.
//               print('Returned from PostRequestsPage');
//             },
//             child: const Text('Request', style: TextStyle(color: Color(0xFFFE5B2A)),),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel', style: TextStyle(color: Colors.grey),),
//           ),
//         ],
//       );
//     },
//   );
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       body: FutureBuilder<List<Post>>(
//         future: _getAllPosts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Center the CircularProgressIndicator when loading.
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
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
//                             style: const TextStyle(color: Colors.white),
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




// after state
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart'; // Import provider
// import 'post_req.dart';
// import 'post_model_cli.dart';

// // Create a simple provider class to track state
// class YourProviderClass extends ChangeNotifier {
//   // Add any state you want to manage here
// }

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
//             postId: '',
//           );
//         }
//         return Post(
//             userId: '', image: '', caption: '', userEmail: '', postId: '');
//       }).toList();
//     } catch (e) {
//       print('Error fetching posts: $e');
//       return [];
//     }
//   }

//   void _showRequestDialog(BuildContext context, Post post) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//           title: const Text(
//             'Request Post',
//             style: TextStyle(color: Colors.white),
//           ),
//           content: const Text(
//             'Do you want to request this post ?',
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PostRequestsPage(post: post),
//                   ),
//                 );
//                 print('Returned from PostRequestsPage');
//               },
//               child: const Text(
//                 'Request',
//                 style: TextStyle(color: Color(0xFFFE5B2A)),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.grey),
//               ),
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
//       body: FutureBuilder<List<Post>>(
//         future: _getAllPosts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
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
//                     margin: const EdgeInsets.only(bottom: 16.0),
//                     child: ListTile(
//                       title: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             post.caption,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           const SizedBox(height: 8),
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



// latest req 23-11-2023
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart'; // Import provider
import 'chat_req.dart';
import 'post_req.dart';
import 'post_model_cli.dart';

// Create a simple provider class to track state
class YourProviderClass extends ChangeNotifier {
  // Add any state you want to manage here
}

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
            postId: '',
          );
        }
        return Post(
            userId: '', image: '', caption: '', userEmail: '', postId: '');
      }).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }

  void _showRequestDialog(Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 32, 32, 31),
          title: const Text(
            'Request Post',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'Do you want to send a request for this post?',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.of(context).pop(); // Close the dialog
            //     _sendRequest(post);
            //   },
            //   child: const Text(
            //     'Request',
            //     style: TextStyle(color: Color(0xFFFE5B2A)),
            //   ),
            // ),
            TextButton(
  onPressed: () {
    Navigator.of(context).pop(); // Close the dialog
    _sendRequest(post);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatRequestPage(
          // receiverUserEmail: userEmail,
          // receiverUserID: userEmail,
          receiverUserId: '', receiverUserEmail: '', receiverUserID: '',
        ),
      ),
    );
  },
  child: const Text(
    'Request',
    style: TextStyle(color: Color(0xFFFE5B2A)),
  ),
),

          ],
        );
      },
    );
  }

  void _sendRequest(Post post) {
 
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request sent for ${post.caption}'),
      ),
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
            return const Center(
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
                    _showRequestDialog(post);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.caption,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
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
