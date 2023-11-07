import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'post_model_cli.dart';

class UserPostsPage extends StatefulWidget {
  @override
  _UserPostsPageState createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  final User? user = FirebaseAuth.instance.currentUser;

  // Fetch posts created by the logged-in user
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
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Posts'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _getUserPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Post> userPosts = snapshot.data!;
            return ListView.builder(
              itemCount: userPosts.length,
              itemBuilder: (context, index) {
                final post = userPosts[index];
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
