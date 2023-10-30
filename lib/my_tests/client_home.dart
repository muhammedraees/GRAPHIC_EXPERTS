// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class Post {
//   final String title;
//   final String text;
//   final File? image;
//   final DateTime timestamp;
//   Post({required this.title, required this.text, this.image, required this.timestamp});
// }

// class ClientHomeScreen extends StatefulWidget {
//   @override
//   _ClientHomeScreenState createState() => _ClientHomeScreenState();
// }

// class _ClientHomeScreenState extends State<ClientHomeScreen> {
//   final List<Post> _posts = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Client Home Screen'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _posts.length,
//               itemBuilder: (context, index) {
//                 final post = _posts[index];
//                 return Card(
//                   margin: EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(post.title),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(post.text),
//                         if (post.image != null) // Display the image if available
//                           Image.file(post.image!),
//                         Text(
//                           'Posted on: ${post.timestamp.toLocal()}',
//                           style: TextStyle(fontSize: 12),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreatePostPage()),
//           ).then((newPost) {
//             if (newPost != null) {
//               setState(() {
//                 _posts.add(newPost);
//               });
//             }
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class CreatePostPage extends StatefulWidget {
//   @override
//   _CreatePostPageState createState() => _CreatePostPageState();
// }

// class _CreatePostPageState extends State<CreatePostPage> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _textController = TextEditingController();
//   File? _image;

//   Future _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery); // You can also use ImageSource.camera for the camera

//     setState(() {
//       _image = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 hintText: 'Enter title',
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: 'Enter text',
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _getImage, // Call _getImage to pick an image
//               child: Text('Pick Image'),
//             ),
//             if (_image != null) // Display the picked image if available
//               Image.file(_image!),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final title = _titleController.text;
//                 final text = _textController.text;
//                 final timestamp = DateTime.now();

//                 if (title.isNotEmpty && text.isNotEmpty) {
//                   final newPost = Post(
//                     title: title,
//                     text: text,
//                     image: _image,
//                     timestamp: timestamp,
//                   );
//                   Navigator.pop(context, newPost);
//                 }
//               },
//               child: Text('Create Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';

// class Post {
//   final String title;
//   final String text;
//   final String imageUrl; // Store the image URL
//   final DateTime timestamp;

//   Post({
//     required this.title,
//     required this.text,
//     required this.imageUrl,
//     required this.timestamp,
//   });

//   // Define a constructor to create a Post object from a map
//   Post.fromMap(Map<String, dynamic> map)
//       : title = map['title'],
//         text = map['text'],
//         imageUrl = map['imageUrl'],
//         timestamp = (map['timestamp'] as Timestamp)
//             .toDate(); // Convert Timestamp to DateTime

//   // Define a method to convert Post to a map
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
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
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
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }

//                 _posts.clear();

//                 final documents = snapshot.data!.docs;

//                 for (var document in documents) {
//                   final data = document.data() as Map<String, dynamic>;
//                   _posts.add(Post.fromMap(data));
//                 }
//                 return ListView.separated(
//                   itemCount: _posts.length,
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       height: 1,
//                     ); // No separator
//                   },
//                   itemBuilder: (context, index) {
//                     final post = _posts[index];
//                     return Card(
//                       color: Color.fromARGB(255, 32, 32, 31),
//                       margin: EdgeInsets.all(8.0),
//                       child: ListTile(
//                         title: Text(
//                           post.title,
//                           style: TextStyle(
//                             color: Colors.white, // Set the text color to white
//                           ),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 10),
//                             Text(
//                               post.text,
//                               style: TextStyle(
//                                 color:
//                                     Colors.white, // Set the text color to white
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             if (post.imageUrl.isNotEmpty)
//                               Image.network(post.imageUrl),
//                             // Display the image using its URL
//                             SizedBox(height: 10),
//                             Text(
//                               'Posted on: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(post.timestamp.toLocal())}',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(height: 30),
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
//         backgroundColor: Color(0xFFFE5B2A),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CreatePostPage()),
//           ).then((newPost) {
//             if (newPost != null) {
//               setState(() {
//                 // Add the new post to the list
//                 _posts.add(newPost);
//               });

//               // Store the new post in Firebase Firestore
//               FirebaseFirestore.instance
//                   .collection('posts')
//                   .add(newPost.toMap());
//             }
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class CreatePostPage extends StatefulWidget {
//   @override
//   _CreatePostPageState createState() => _CreatePostPageState();
// }

// class _CreatePostPageState extends State<CreatePostPage> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _textController = TextEditingController();
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
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: 'Caption',
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(color: Colors.grey),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _textController,
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: 'Matter',
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(color: Colors.grey),
//               ),
//             ),
//             SizedBox(height: 16),
//             IconButton(
//               onPressed: _getImage,
//               icon: Icon(
//                 Icons.camera_alt,
//                 color: Color(0xFFFE5B2A), // Set icon color to orange
//               ),
//             ),
//             if (_image != null) Image.file(_image!),
//             SizedBox(height: 16),
//             ElevatedButton(
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 backgroundColor: MaterialStateProperty.all(
//                   Color(0xFFFE5B2A),
//                 ),
//               ),
//               onPressed: () async {
//                 final title = _titleController.text;
//                 final text = _textController.text;
//                 final timestamp = DateTime.now();

//                 if (title.isNotEmpty && text.isNotEmpty) {
//                   final imageUrl = await _uploadImage();

//                   final newPost = Post(
//                     title: title,
//                     text: text,
//                     imageUrl: imageUrl,
//                     timestamp: timestamp,
//                   );

//                   // Pop the current screen and return to the home page
//                   Navigator.pop(context, newPost);
//                 }
//               },
//               child: Text('Create Post'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }