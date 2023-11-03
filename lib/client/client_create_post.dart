import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'client_home_page.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // ... Your existing code for the create post screen ...
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  File? _image;

  Future _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future<String> _uploadImage() async {
    if (_image == null) return '';

    final storageReference =
        FirebaseStorage.instance.ref().child('images/${_image!.path}');

    final uploadTask = storageReference.putFile(_image!);

    final snapshot = await uploadTask.whenComplete(() => null);

    final downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Create Post'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Caption',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _textController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Matter',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: _getImage,
              icon: const Icon(
                Icons.camera_alt,
                color: Color(0xFFFE5B2A), // Set icon color to orange
              ),
            ),
            if (_image != null) Image.file(_image!),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFFFE5B2A),
                ),
              ),
              onPressed: () async {
                final title = _titleController.text;
                final text = _textController.text;
                final timestamp = DateTime.now();

                if (title.isNotEmpty && text.isNotEmpty) {
                  final imageUrl = await _uploadImage();

                  if (imageUrl != null) {
                    final newPost = Post(
                      title: title,
                      text: text,
                      imageUrl: imageUrl,
                      timestamp: timestamp,
                      id: '',
                    );

                    // Ensure newPost is not null before calling Navigator.pop
                    if (newPost != null) {
                      Navigator.pop(context, newPost);
                    }
                  } else {
                    // Handle the case where the image upload failed
                    // You can show an error message or take appropriate action here.
                  }
                }
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
