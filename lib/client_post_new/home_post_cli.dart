import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'post_model_cli.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Fetch all posts from Firestore
  // Future<List<Post>> _getAllPosts() async {
  //   final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('posts').get();
  //   return snapshot.docs.map((doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     return Post(
  //       userId: data['userId'],
  //       image: data['image'],
  //       caption: data['caption'],
  //     );
  //   }).toList();
  // }
  Future<List<Post>> _getAllPosts() async {
  try {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('posts').get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      if (data.containsKey('userId') &&
          data.containsKey('image') &&
          data.containsKey('caption')) {
        return Post(
          userId: data['userId'],
          image: data['image'],
          caption: data['caption'],
        );
      }
      // Handle missing fields in the document as needed
      return Post(userId: '', image: '', caption: '');
    }).toList();
  } catch (e) {
    print('Error fetching posts: $e');
    return []; // Return an empty list in case of an error
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Post> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.caption),
                  // Display the image here
                );
              },
            );
          }
        },
      ),
    );
  }
}
