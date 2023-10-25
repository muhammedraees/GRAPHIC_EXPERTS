// create profile new page 
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class SendOrUpdateData extends StatefulWidget {
//   final String username;
//   final String jobType;
//   final String experience;
//   final String skills;
//   final String link;
//   final String imagePath;
//   final String id;

//   const SendOrUpdateData({
//     this.username = '',
//     this.jobType = '',
//     this.experience = '',
//     this.skills = '',
//     this.link = '',
//     this.imagePath = '',
//     this.id = '',
//   });

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

//   Future<String?> _uploadImageToStorage() async {
//     if (_image != null) {
//       try {
//         final Reference storageRef = FirebaseStorage.instance.ref().child(
//             'user_profiles/${widget.id}/${DateTime.now().millisecondsSinceEpoch}.jpg');
//         final UploadTask uploadTask = storageRef.putFile(_image!);
//         final TaskSnapshot taskSnapshot = await uploadTask;
//         final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
//         return downloadUrl;
//       } catch (e) {
//         print('Error uploading image: $e');
//       }
//     }
//     return null;
//   }

//   @override
//   void initState() {
//     super.initState();

//     usernameController.text = widget.username;
//     jobTypeController.text = widget.jobType;
//     experienceController.text = widget.experience;
//     skillsController.text = widget.skills;
//     linkController.text = widget.link;
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 32, 31),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 32, 32, 31),
//         elevation: 0,
//         centerTitle: true,
//         title: Text('Edit Profile'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: (Color(0xFFFE5B2A)),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Username',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: jobTypeController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Job type',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: experienceController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Experience',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: skillsController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Skills',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: linkController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Link',
//                   border: InputBorder.none,
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               SizedBox(height: 40),
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
//                         Color(0xFFFE5B2A),
//                       ),
//                     ),
//                     onPressed: () async {
//                       setState(() {});
//                       if (usernameController.text.isEmpty ||
//                           jobTypeController.text.isEmpty ||
//                           experienceController.text.isEmpty ||
//                           skillsController.text.isEmpty ||
//                           linkController.text.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Fill in all fields')),
//                         );
//                       } else {
//                         final dUser = FirebaseFirestore.instance
//                             .collection('users')
//                             .doc(widget.id.isNotEmpty ? widget.id : null);
//                         String docID = '';
//                         if (widget.id.isNotEmpty) {
//                           docID = widget.id;
//                         } else {
//                           docID = dUser.id;
//                         }
//                         final downloadUrl = await _uploadImageToStorage();
//                         if (downloadUrl != null) {
//                           final jsonData = {
//                             'username': usernameController.text,
//                             'jobType': jobTypeController.text,
//                             'experience': experienceController.text,
//                             'skills': skillsController.text,
//                             'link': linkController.text,
//                             'profile': downloadUrl,
//                             'id': docID,
//                           };
//                           showProgressIndicator = true;
//                           if (widget.id.isEmpty) {
//                             await dUser.set(jsonData).then((value) {
//                               usernameController.text = '';
//                               jobTypeController.text = '';
//                               experienceController.text = '';
//                               skillsController.text = '';
//                               linkController.text = '';
//                               showProgressIndicator = false;
//                               setState(() {});
//                             });
//                           } else {
//                             await dUser.update(jsonData).then((value) {
//                               usernameController.text = '';
//                               jobTypeController.text = '';
//                               experienceController.text = '';
//                               skillsController.text = '';
//                               linkController.text = '';
//                               showProgressIndicator = false;
//                               setState(() {});
//                             });
//                           }
//                         }
//                       }
//                     },
//                     child: Text('Save'),
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