//  working code before 24
// import 'dart:developer';
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
//     super.key,
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

//   Future<void> _uploadImage() async {
//     if (_image != null) {
//       try {
//         final firebaseStorageRef =
//             FirebaseStorage.instance.ref().child('profile_images/${widget.id}.jpg');

//         await firebaseStorageRef.putFile(_image!);

//         final imageUrl = await firebaseStorageRef.getDownloadURL();

//         final dUser = FirebaseFirestore.instance
//             .collection('users')
//             .doc(widget.id.isNotEmpty ? widget.id : null);

//         // Now, you can use imageUrl to store the image URL in Firestore.
//         final jsonData = {
//           'username': usernameController.text,
//           'jobType': jobTypeController.text,
//           'experience': experienceController.text,
//           'skills': skillsController.text,
//           'link': linkController.text,
//           'profile': imageUrl,
//           'id': widget.id // Use the appropriate docID here
//         };

//         showProgressIndicator = true;

//         if (widget.id.isEmpty) {
//           await dUser.set(jsonData).then((value) {
//             usernameController.text = '';
//             jobTypeController.text = '';
//             experienceController.text = '';
//             skillsController.text = '';
//             linkController.text = '';
//             showProgressIndicator = false;
//             setState(() {});
//           });
//         } else {
//           await dUser.update(jsonData).then((value) {
//             usernameController.text = '';
//             jobTypeController.text = '';
//             experienceController.text = '';
//             skillsController.text = '';
//             linkController.text = '';
//             showProgressIndicator = false;
//             setState(() {});
//           });
//         }
//       } catch (e) {
//         // print('Error uploading image: $e');
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
//             color: (Color(0xFFFE5B2A)),
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
//                     log("image${_image.toString()}");
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
//                                 'assets/images/unknow_profile.jpg',
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
//                   child: 
//                   ElevatedButton(
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
//                       setState(() {});
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
//                     child: const Text(
//                       'Save',
//                     ),
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

// 24 working code
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class SendOrUpdateData extends StatefulWidget {
  final String username;
  final String jobType;
  final String experience;
  final String skills;
  final String link;
  final String imagePath;

  const SendOrUpdateData({
    Key? key,
    this.username = '',
    this.jobType = '',
    this.experience = '',
    this.skills = '',
    this.link = '',
    this.imagePath = '', required String id,
  });

  @override
  State<SendOrUpdateData> createState() => _SendOrUpdateDataState();
}

class _SendOrUpdateDataState extends State<SendOrUpdateData> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  File? _image;
  bool showProgressIndicator = false;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    usernameController.text = widget.username;
    jobTypeController.text = widget.jobType;
    experienceController.text = widget.experience;
    skillsController.text = widget.skills;
    linkController.text = widget.link;
  }

  @override
  void dispose() {
    usernameController.dispose();
    jobTypeController.dispose();
    experienceController.dispose();
    skillsController.dispose();
    linkController.dispose();
    super.dispose();
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      try {
        final firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

        await firebaseStorageRef.putFile(_image!);

        final imageUrl = await firebaseStorageRef.getDownloadURL();

        final dUser = FirebaseFirestore.instance.collection('users').doc();

        // Now, you can use imageUrl to store the image URL in Firestore.
        final jsonData = {
          'username': usernameController.text,
          'jobType': jobTypeController.text,
          'experience': experienceController.text,
          'skills': skillsController.text,
          'link': linkController.text,
          'profile': imageUrl,
        };

        showProgressIndicator = true;

        await dUser.set(jsonData).then((value) {
          usernameController.text = '';
          jobTypeController.text = '';
          experienceController.text = '';
          skillsController.text = '';
          linkController.text = '';
          showProgressIndicator = false;
          setState(() {});
        });
      } catch (e) {
        // print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Edit Profile'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    log("image${_image.toString()}");
                    _getImage();
                  },
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 80,
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(
                                _image!,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                'assets/images/unknow_profile.jpg',
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Username',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: jobTypeController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Job type',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: experienceController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Experience',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: skillsController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Skills',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: linkController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Link',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
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
                      setState(() {});
                      if (usernameController.text.isEmpty ||
                          jobTypeController.text.isEmpty ||
                          experienceController.text.isEmpty ||
                          skillsController.text.isEmpty ||
                          linkController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fill in all fields')),
                        );
                      } else {
                        await _uploadImage(); // Upload image before updating Firestore
                      }
                    },
                    child: const Text(
                      'Save',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class UserProfile {
//   final String username;
//   final String jobType;
//   final String experience;
//   final String skills;
//   final String link;
//   final String profileImageURL;
//   final String id;

//   UserProfile({
//     required this.username,
//     required this.jobType,
//     required this.experience,
//     required this.skills,
//     required this.link,
//     required this.profileImageURL,
//     required this.id,
//   });
// }

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController jobTypeController = TextEditingController();
//   TextEditingController experienceController = TextEditingController();
//   TextEditingController skillsController = TextEditingController();
//   TextEditingController linkController = TextEditingController();
//   File? _image;
//   String userId = "your_user_id_here"; // Replace with the actual user ID

//   bool isEditing = false;

//   @override
//   void initState() {
//     super.initState();

//     // Load user data if in editing mode
//     if (isEditing) {
//       // Load user data from Firestore and set the values in the controllers
//       // You can use 'userId' to identify the user whose data is being edited
//       // Example: Get user data using 'userId' and populate the controllers
//     }
//   }

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   Future<void> _uploadImage() async {
//     if (_image != null) {
//       try {
//         final firebaseStorageRef = FirebaseStorage.instance
//             .ref()
//             .child('profile_images/$userId.jpg');

//         await firebaseStorageRef.putFile(_image!);

//         final imageUrl = await firebaseStorageRef.getDownloadURL();

//         final userRef = FirebaseFirestore.instance
//             .collection('users')
//             .doc(userId); // Use 'userId' to reference the user document

//         final userData = {
//           'username': usernameController.text,
//           'jobType': jobTypeController.text,
//           'experience': experienceController.text,
//           'skills': skillsController.text,
//           'link': linkController.text,
//           'profile': imageUrl,
//         };

//         if (!isEditing) {
//           await userRef.set(userData);
//         } else {
//           await userRef.update(userData);
//         }

//         // Reset the form
//         usernameController.text = '';
//         jobTypeController.text = '';
//         experienceController.text = '';
//         skillsController.text = '';
//         linkController.text = '';
//         setState(() {});
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
//         title: Text(isEditing ? 'Edit Profile' : 'User Profile'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xFFFE5B2A),
//           ),
//         ),
//         actions: [
//           if (!isEditing)
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isEditing = true;
//                 });
//               },
//               icon: const Icon(
//                 Icons.edit,
//                 color: Color(0xFFFE5B2A),
//               ),
//             ),
//         ],
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
//                         await _uploadImage();
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


