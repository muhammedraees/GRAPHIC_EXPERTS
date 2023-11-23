import 'package:flutter/material.dart';
// import 'package:your_project_name/chat_req.dart'; // Update with correct import
import 'post_model_cli.dart';
import 'post_req.dart'; // Update with correct import
// import 'post_requests_page.dart'; // Add this import

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
          // Display post details here (post.caption, post.image, etc.)
          // ...

          // Example: Displaying post caption and image
          Text(
            'Caption: ${post.caption}',
            style: TextStyle(fontSize: 18),
          ),
          Image.network(post.image),

          // Adding some spacing
          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              _navigateToRequestsPage(context, post);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFFFE5B2A)), // Change button color
              foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.white), // Change text color
            ),
            child: Text('View request'), // Change the text
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
