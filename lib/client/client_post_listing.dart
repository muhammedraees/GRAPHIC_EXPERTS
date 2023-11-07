// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'client_home_page.dart';

// class AllPostsPage extends StatefulWidget {
//   @override
//   _AllPostsPageState createState() => _AllPostsPageState();
// }

// class _AllPostsPageState extends State<AllPostsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Posts'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final documents = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               final post = Post.fromMap(documents[index]);
//               return Card(
//                 color: const Color.fromARGB(255, 32, 32, 31),
//                 margin: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   title: Text(
//                     post.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 10),
//                       Text(
//                         post.text,
//                         style: const TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       if (post.imageUrl.isNotEmpty) Image.network(post.imageUrl),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Posted on: ${post.formattedTimestamp()}',
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
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
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'client_home_page.dart';

class AllPostsPage extends StatefulWidget {
  @override
  _AllPostsPageState createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Posts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final post = Post.fromMap(documents[index]);
              return GestureDetector(
                onTap: () {
                  _showRequestDialog(context, post);
                },
                child: Card(
                  color: const Color.fromARGB(255, 32, 32, 31),
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      post.title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    // ... Other post details
                    subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        post.text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (post.imageUrl.isNotEmpty) Image.network(post.imageUrl),
                      const SizedBox(height: 10),
                      Text(
                        'Posted on: ${post.formattedTimestamp()}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showRequestDialog(BuildContext context, Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Post'),
          content: Text('Do you want to request this post?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Handle the request logic here
                // You can add your request handling code
                Navigator.of(context).pop();
              },
              child: Text('Request'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}





