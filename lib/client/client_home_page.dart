// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

// class Post {
//   final String id; // Added id to uniquely identify each post
//   final String title;
//   final String text;
//   final String imageUrl;
//   final DateTime timestamp;
//   String formattedTimestamp() {
//     final formattedDate = DateFormat('d MMM y').format(timestamp);
//     final formattedTime = DateFormat('h:mma')
//         .format(timestamp)
//         .replaceAll('AM', 'am')
//         .replaceAll('PM', 'pm');

//     return '$formattedDate $formattedTime';
//   }

//   Post({
//     required this.id,
//     required this.title,
//     required this.text,
//     required this.imageUrl,
//     required this.timestamp,
//   });

//   Post.fromMap(DocumentSnapshot doc)
//       : id = doc.id,
//         title = doc['title'],
//         text = doc['text'],
//         imageUrl = doc['imageUrl'],
//         timestamp = (doc['timestamp'] as Timestamp).toDate();

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'text': text,
//       'imageUrl': imageUrl,
//       'timestamp': timestamp,
//     };
//   }
// }

// class ClientHomeScreen extends StatefulWidget {
//   @override
//   _ClientHomeScreenState createState() => _ClientHomeScreenState();
// }

// class _ClientHomeScreenState extends State<ClientHomeScreen> {
//   final List<Post> _posts = [];

//   @override
//   void initState() {
//     super.initState();
//     loadPosts();
//   }

//   Future<void> loadPosts() async {
//     final snapshot = await FirebaseFirestore.instance.collection('posts').get();

//     setState(() {
//       _posts.clear();

//       for (var document in snapshot.docs) {
//         final data = document.data() as Map<String, dynamic>;
//         _posts.add(Post.fromMap(document));
//       }
//     });
//   }

//   Future<void> deletePost(String postId) async {
//     await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
//     loadPosts(); // Reload the posts after deleting one
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           'Home',
//           style: TextStyle(fontWeight: FontWeight.w300),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream:
//                   FirebaseFirestore.instance.collection('posts').snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${snapshot.error}'),
//                   );
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 final documents = snapshot.data!.docs;

//                 return ListView.builder(
//                   itemCount: _posts.length,
//                   itemBuilder: (context, index) {
//                     final post = _posts[index];
//                     return Card(
//                       color: const Color.fromARGB(255, 32, 32, 31),
//                       margin: const EdgeInsets.all(8.0),
//                       child: ListTile(
//                         title: Text(
//                           post.title,
//                           style: const TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 10),
//                             Text(
//                               post.text,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             if (post.imageUrl.isNotEmpty)
//                               Image.network(post.imageUrl),
//                             const SizedBox(height: 10),
//                             Text(
//                               'Posted on: ${post.formattedTimestamp()}',
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(height: 30),
//                             // Delete button
//                             ElevatedButton(
//                               onPressed: () {
//                                 deletePost(post.id);
//                               },
//                               child: const Text('Delete Post'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Call a function to edit the post
//                                 Future<void> editPost(Post post) async {
//                                   final updatedPost = await Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           EditPostPage(post: post),
//                                     ),
//                                   );

//                                   if (updatedPost != null) {
//                                     // Update the post in Firebase or your data source if needed
//                                     // In this example, we'll just update it locally
//                                     final index = _posts
//                                         .indexWhere((p) => p.id == post.id);
//                                     if (index != -1) {
//                                       setState(() {
//                                         _posts[index] = updatedPost;
//                                       });
//                                     }
//                                   }
//                                 }

//                                 editPost(post);
//                               },
//                               child: const Text('Edit Post'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFFFE5B2A),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreatePostPage()),
//           ).then((newPost) {
//             if (newPost != null) {
//               FirebaseFirestore.instance
//                   .collection('posts')
//                   .add(newPost.toMap());
//               loadPosts();
//             }
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class CreatePostPage extends StatefulWidget {
//   @override
//   _CreatePostPageState createState() => _CreatePostPageState();
// }

// class _CreatePostPageState extends State<CreatePostPage> {
//   // ... Your existing code for the create post screen ...
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _textController = TextEditingController();
//   File? _image;

//   Future _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }

//   Future<String> _uploadImage() async {
//     if (_image == null) return '';

//     final storageReference =
//         FirebaseStorage.instance.ref().child('images/${_image!.path}');

//     final uploadTask = storageReference.putFile(_image!);

//     final snapshot = await uploadTask.whenComplete(() => null);

//     final downloadUrl = await snapshot.ref.getDownloadURL();

//     return downloadUrl;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text('Create Post'),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: (Color(0xFFFE5B2A)),
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: _titleController,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 hintText: 'Caption',
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _textController,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 hintText: 'Matter',
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 16),
//             IconButton(
//               onPressed: _getImage,
//               icon: const Icon(
//                 Icons.camera_alt,
//                 color: Color(0xFFFE5B2A), // Set icon color to orange
//               ),
//             ),
//             if (_image != null) Image.file(_image!),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 backgroundColor: MaterialStateProperty.all(
//                   const Color(0xFFFE5B2A),
//                 ),
//               ),
//               onPressed: () async {
//                 final title = _titleController.text;
//                 final text = _textController.text;
//                 final timestamp = DateTime.now();

//                 if (title.isNotEmpty && text.isNotEmpty) {
//                   final imageUrl = await _uploadImage();

//                   if (imageUrl != null) {
//                     final newPost = Post(
//                       title: title,
//                       text: text,
//                       imageUrl: imageUrl,
//                       timestamp: timestamp,
//                       id: '',
//                     );

//                     // Ensure newPost is not null before calling Navigator.pop
//                     if (newPost != null) {
//                       Navigator.pop(context, newPost);
//                     }
//                   } else {
//                     // Handle the case where the image upload failed
//                     // You can show an error message or take appropriate action here.
//                   }
//                 }
//               },
//               child: const Text('Create Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // after delete

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'client_create_post.dart';
import 'client_post_edit.dart';

class Post {
  final String id; // Added id to uniquely identify each post
  final String title;
  final String text;
  final String imageUrl;
  final DateTime timestamp;
  String formattedTimestamp() {
    final formattedDate = DateFormat('d MMM y').format(timestamp);
    final formattedTime = DateFormat('h:mma')
        .format(timestamp)
        .replaceAll('AM', 'am')
        .replaceAll('PM', 'pm');

    return '$formattedDate $formattedTime';
  }

  Post({
    required this.id,
    required this.title,
    required this.text,
    required this.imageUrl,
    required this.timestamp,
  });

  Post.fromMap(DocumentSnapshot doc)
      : id = doc.id,
        title = doc['title'],
        text = doc['text'],
        imageUrl = doc['imageUrl'],
        timestamp = (doc['timestamp'] as Timestamp).toDate();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }
}

class ClientHomeScreen extends StatefulWidget {
  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    final snapshot = await FirebaseFirestore.instance.collection('posts').get();

    setState(() {
      _posts.clear();

      for (var document in snapshot.docs) {
        final data = document.data() as Map<String, dynamic>;
        _posts.add(Post.fromMap(document));
      }
    });
  }

  Future<void> deletePost(String postId) async {
    await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
    loadPosts(); // Reload the posts after deleting one
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return Card(
                      color: const Color.fromARGB(255, 32, 32, 31),
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          post.title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
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
                            if (post.imageUrl.isNotEmpty)
                              Image.network(post.imageUrl),
                            const SizedBox(height: 10),
                            Text(
                              'Posted on: ${post.formattedTimestamp()}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            // const SizedBox(height: 30),
                            // Delete button
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    deletePost(post.id);
                                  },
                                  icon: Icon(Icons.delete,color: Colors.grey,),
                                  // child: const Text('Delete Post'),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Call a function to edit the post
                                    Future<void> editPost(Post post) async {
                                      final updatedPost = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PostEditPage(post: post),
                                        ),
                                      );

                                      if (updatedPost != null) {
                                        // Update the post in Firebase or your data source if needed
                                        // In this example, we'll just update it locally
                                        final index = _posts
                                            .indexWhere((p) => p.id == post.id);
                                        if (index != -1) {
                                          setState(() {
                                            _posts[index] = updatedPost;
                                          });
                                        }
                                      }
                                    }

                                    editPost(post);
                                  },
                                  icon: Icon(Icons.edit,color: Colors.grey,),
                                  // child: const Text('Edit Post'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFE5B2A),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage()),
          ).then((newPost) {
            if (newPost != null) {
              FirebaseFirestore.instance
                  .collection('posts')
                  .add(newPost.toMap());
              loadPosts();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



