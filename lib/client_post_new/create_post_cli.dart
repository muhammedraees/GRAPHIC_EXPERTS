// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// import 'post_listing_cli.dart';

// class CreatePostPage extends StatefulWidget {
//   @override
//   _CreatePostPageState createState() => _CreatePostPageState();
// }

// class _CreatePostPageState extends State<CreatePostPage> {
//   final TextEditingController captionController = TextEditingController();
//   XFile? imageFile;

//   void _selectImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         imageFile = pickedImage;
//       });
//     }
//   }

//   void _uploadPost() async {
//     if (imageFile == null || captionController.text.isEmpty) {
//       // Handle validation here
//       return;
//     }

//     // Upload the image to Firebase Storage
//     final Reference storageRef =
//         FirebaseStorage.instance.ref().child('posts/${DateTime.now()}.jpg');
//     await storageRef.putFile(File(imageFile!.path));
//     final String imageUrl = await storageRef.getDownloadURL();

//     // Get the current user's ID from Firebase Authentication
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       String userId = user.uid;

//       // Save the post data in Firestore
//       FirebaseFirestore.instance.collection('posts').add({
//         'userId': userId,
//         'image': imageUrl,
//         'caption': captionController.text,
//       });

//       // After saving, navigate to the post listing page.
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => UserPostsPage()));
//     } else {
//       // Handle the case where the user is not signed in or 'user' is null
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             if (imageFile != null)
//               Image.file(
//                 File(imageFile!.path),
//                 height: 200,
//                 width: 200,
//               ),
//             ElevatedButton(
//               onPressed: _selectImage,
//               child: Text('Select Image'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: captionController,
//                 decoration: InputDecoration(labelText: 'Caption'),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _uploadPost,
//               child: Text('Upload Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'post_listing_cli.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController captionController = TextEditingController();
  XFile? imageFile;

  void _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = pickedImage;
      });
    }
  }

  // void _uploadPost() async {
  //   if (imageFile == null || captionController.text.isEmpty) {
  //     // Handle validation here
  //     return;
  //   }

  //   // Upload the image to Firebase Storage
  //   final Reference storageRef =
  //       FirebaseStorage.instance.ref().child('posts/${DateTime.now()}.jpg');
  //   await storageRef.putFile(File(imageFile!.path));
  //   final String imageUrl = await storageRef.getDownloadURL();

  //   // Get the current user's ID from Firebase Authentication
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String userId = user.uid;

  //     // Save the post data in Firestore
  //     FirebaseFirestore.instance.collection('posts').add({
  //       'userId': userId,
  //       'image': imageUrl,
  //       'caption': captionController.text,
  //       'userEmail': userEmail, // Add this line
  //     });

  //     // After saving, navigate to the post listing page.
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => UserPostsPage()));
  //   } else {
  //     // Handle the case where the user is not signed in or 'user' is null
  //   }
  // }
  void _uploadPost() async {
  if (imageFile == null || captionController.text.isEmpty) {
    // Handle validation here
    return;
  }

  // Upload the image to Firebase Storage
  final Reference storageRef =
      FirebaseStorage.instance.ref().child('posts/${DateTime.now()}.jpg');
  await storageRef.putFile(File(imageFile!.path));
  final String imageUrl = await storageRef.getDownloadURL();

  // Get the current user from Firebase Authentication
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String userId = user.uid;
    String? userEmail = user.email; // Fetch the user's email

    // Save the post data in Firestore, including the user's email
    FirebaseFirestore.instance.collection('posts').add({
      'userId': userId,
      'image': imageUrl,
      'caption': captionController.text,
      'userEmail': userEmail,
    });

    // After saving, navigate to the post listing page.
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPostsPage()));
  } else {
    // Handle the case where the user is not signed in or 'user' is null
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            if (imageFile != null)
              Image.file(
                File(imageFile!.path),
                height: 200,
                width: 200,
              ),
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Select Image'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: captionController,
                decoration: InputDecoration(labelText: 'Caption'),
              ),
            ),
            ElevatedButton(
              onPressed: _uploadPost,
              child: Text('Upload Post'),
            ),
          ],
        ),
      ),
    );
  }
}
