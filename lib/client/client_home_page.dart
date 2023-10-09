import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Post {
  final String title;
  final String text;
  final File? image;
  final DateTime timestamp;
  Post({required this.title, required this.text, this.image, required this.timestamp});
}

class ClientHomeScreen extends StatefulWidget {
  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Home Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.text),
                        if (post.image != null) // Display the image if available
                          Image.file(post.image!),
                        Text(
                          'Posted on: ${post.timestamp.toLocal()}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          ).then((newPost) {
            if (newPost != null) {
              setState(() {
                _posts.add(newPost);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  File? _image;

  Future _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // You can also use ImageSource.camera for the camera

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter title',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter text',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImage, // Call _getImage to pick an image
              child: Text('Pick Image'),
            ),
            if (_image != null) // Display the picked image if available
              Image.file(_image!),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final text = _textController.text;
                final timestamp = DateTime.now();

                if (title.isNotEmpty && text.isNotEmpty) {
                  final newPost = Post(
                    title: title,
                    text: text,
                    image: _image,
                    timestamp: timestamp,
                  );
                  Navigator.pop(context, newPost);
                }
              },
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
