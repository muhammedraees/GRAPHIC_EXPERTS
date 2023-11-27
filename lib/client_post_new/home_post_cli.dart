import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'post_model_cli.dart';
import 'chat_req.dart';

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

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0,
                    height: 16.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              subtitle: Container(
                width: double.infinity,
                height: 200.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150.0,
                height: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _sendRequest(post);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRequestPage(
                      receiverUserId: '',
                      receiverUserEmail: '',
                      receiverUserID: '',
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
            return ListView.builder(
              itemCount: 5, // Set a fixed number of shimmer loading items
              itemBuilder: (context, index) {
                return _buildShimmerLoading();
              },
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Posted on: ${DateFormat('dd MMM yyyy').format(DateTime.now())}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
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
