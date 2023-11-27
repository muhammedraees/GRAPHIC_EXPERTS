import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileEditingPage extends StatefulWidget {
  @override
  _ProfileEditingPageState createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  TextEditingController usernameController = TextEditingController();
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
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
              const SizedBox(height: 60),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: 'UserName',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: jobtypeController,
                decoration: const InputDecoration(
                    hintText: 'Job type',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: experienceController,
                decoration: const InputDecoration(
                    hintText: 'Experience',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: skillsController,
                decoration: const InputDecoration(
                    hintText: 'Skills',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: linkController,
                decoration: const InputDecoration(
                    hintText: 'Link',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 90),
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
                            const MaterialStatePropertyAll(Color(0xFFFE5B2A))),
                    onPressed: () {
                      Navigator.pop(context);
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
