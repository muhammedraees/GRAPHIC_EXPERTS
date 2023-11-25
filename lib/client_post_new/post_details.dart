import 'package:flutter/material.dart';
import 'post_model_cli.dart';
import 'post_req.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  PostDetailsPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Post Details'),
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
      body: Column(
        children: [
          Text(
            'Caption: ${post.caption}',
            style: const TextStyle(fontSize: 18),
          ),
          Image.network(post.image),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _navigateToRequestsPage(context, post);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFFE5B2A)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: const Text('View request'),
          )
        ],
      ),
    );
  }

  void _navigateToRequestsPage(BuildContext context, Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostRequestsPage(post: post),
      ),
    );
  }
}
