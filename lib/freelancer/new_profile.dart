// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfile {
//   final String id;
//   final String username;
//   final String jobType;
//   final String experience;
//   final String skills;
//   final String link;
//   final String profileImageUrl;

//   UserProfile({
//     required this.id,
//     required this.username,
//     required this.jobType,
//     required this.experience,
//     required this.skills,
//     required this.link,
//     required this.profileImageUrl,
//   });
// }

// class SendOrUpdateData extends StatefulWidget {
//   final UserProfile? userProfile;

//   SendOrUpdateData({Key? key, this.userProfile}) : super(key: key);

//   @override
//   State<SendOrUpdateData> createState() => _SendOrUpdateDataState();
// }

// class _SendOrUpdateDataState extends State<SendOrUpdateData> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController jobTypeController = TextEditingController();
//   TextEditingController experienceController = TextEditingController();
//   TextEditingController skillsController = TextEditingController();
//   TextEditingController linkController = TextEditingController();
//   File? _image;
//   bool showProgressIndicator = false;

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     if (widget.userProfile != null) {
//       // Edit mode: Populate fields with existing data
//       usernameController.text = widget.userProfile!.username;
//       jobTypeController.text = widget.userProfile!.jobType;
//       experienceController.text = widget.userProfile!.experience;
//       skillsController.text = widget.userProfile!.skills;
//       linkController.text = widget.userProfile!.link;
//     }
//   }

//   @override
//   void dispose() {
//     usernameController.dispose();
//     jobTypeController.dispose();
//     experienceController.dispose();
//     skillsController.dispose();
//     linkController.dispose();
//     super.dispose();
//   }

//   Future<void> _uploadImage() async {
//     if (_image != null) {
//       try {
//         final firebaseStorageRef =
//             FirebaseStorage.instance.ref().child('profile_images/${widget.userProfile?.id}.jpg');

//         await firebaseStorageRef.putFile(_image!);

//         final imageUrl = await firebaseStorageRef.getDownloadURL();

//         final userData = {
//           'username': usernameController.text,
//           'jobType': jobTypeController.text,
//           'experience': experienceController.text,
//           'skills': skillsController.text,
//           'link': linkController.text,
//           'profileImageUrl': imageUrl,
//           'id': widget.userProfile?.id // Use the appropriate docID here
//         };

//         if (widget.userProfile == null) {
//           await FirebaseFirestore.instance.collection('users').add(userData);
//         } else {
//           await FirebaseFirestore.instance.collection('users').doc(widget.userProfile?.id).update(userData);
//         }

//         // Clear text fields and image after upload
//         usernameController.clear();
//         jobTypeController.clear();
//         experienceController.clear();
//         skillsController.clear();
//         linkController.clear();
//         setState(() {
//           _image = null;
//         });
//       } catch (e) {
//         print('Error uploading image: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: const Text('Edit Profile'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xFFFE5B2A),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     _getImage();
//                   },
//                   child: Center(
//                     child: CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       radius: 80,
//                       child: _image != null
//                           ? ClipRRect(
//                               borderRadius: BorderRadius.circular(80),
//                               child: Image.file(
//                                 _image!,
//                                 width: 160,
//                                 height: 160,
//                                 fit: BoxFit.cover,
//                               ),
//                             )
//                           : ClipRRect(
//                               borderRadius: BorderRadius.circular(80),
//                               child: Image.asset(
//                                 'assets/images/unknown_profile.jpg',
//                                 width: 160,
//                                 height: 160,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 controller: usernameController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Username',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: jobTypeController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Job type',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: experienceController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Experience',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: skillsController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Skills',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: linkController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   hintText: 'Link',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               const SizedBox(height: 40),
//               Center(
//                 child: Container(
//                   width: 130,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                       backgroundColor: MaterialStateProperty.all(
//                         const Color(0xFFFE5B2A),
//                       ),
//                     ),
//                     onPressed: () async {
//                       if (usernameController.text.isEmpty ||
//                           jobTypeController.text.isEmpty ||
//                           experienceController.text.isEmpty ||
//                           skillsController.text.isEmpty ||
//                           linkController.text.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Fill in all fields')),
//                         );
//                       } else {
//                         await _uploadImage(); // Upload image before updating Firestore
//                       }
//                     },
//                     child: const Text('Save'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
