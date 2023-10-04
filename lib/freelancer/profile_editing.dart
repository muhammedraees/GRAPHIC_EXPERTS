// import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// import 'profile_details.dart';

class ProfileEditingPage extends StatefulWidget {
  @override
  _ProfileEditingPageState createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {

// uploadData()async{

//   Map<String, dynamic> uploaddata={
//     "UserName":usernameController.text,
//     "Job Type":jobtypeController.text,
//     "Experience":experienceController.text,
//     "Skills":skillsController.text,
//     "Link":linkController.text,
//   };

//   Fluttertoast.showToast(
//         msg: "Profile Updated Successfully",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
// }

  TextEditingController usernameController= TextEditingController();
  TextEditingController jobtypeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  File? _image; 

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // children:

            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: _getImage,
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
              SizedBox(height: 60),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'UserName',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: jobtypeController,
                decoration: InputDecoration(
                    hintText: 'Job type',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              // DropdownButton(
              //   hint: Text(
              //     'Job type',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   underline: SizedBox(),
              //   items: [
              //     DropdownMenuItem(value: 'A', child: Text('A')),
              //     DropdownMenuItem(value: 'A', child: Text('A')),
              //     DropdownMenuItem(value: 'A', child: Text('A'))
              //   ],
              //   onChanged: (value) {},
              // ),
              SizedBox(height: 16),
              TextFormField(
                controller: experienceController,
                decoration: InputDecoration(
                    hintText: 'Experience',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: skillsController,
                decoration: InputDecoration(
                    hintText: 'Skills',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 16),
              TextFormField(
                controller: linkController,
                decoration: InputDecoration(
                    hintText: 'Link',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 90),
              Center(
                child: Container(
                  width: 130,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFFFE5B2A))),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProfileDetailsPage(
                      //       name: nameController.text,
                      //       jobTitle: jobTitleController.text,
                      //       experience: experienceController.text,
                      //       // image: _image!,
                      //     ),
                      //   ),
                      // );
                      Navigator.pop(context);
                    },
                    child: Text(
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

  @override
  void dispose() {
    usernameController.dispose();
    jobtypeController.dispose();
    experienceController.dispose();
    skillsController.dispose();
    linkController.dispose();
    super.dispose();
  }
}