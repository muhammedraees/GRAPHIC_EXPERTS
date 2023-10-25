import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientProfilePage extends StatefulWidget {
  const ClientProfilePage({Key? key}) : super(key: key);
  @override
  _ClientProfilePageState createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User? _user;
  String? _username;

  @override
  void initState() {
    super.initState();
    _initializeUser();
    _getUserData();
  }

  Future<void> _initializeUser() async {
    _user = _auth.currentUser;
  }

  Future<void> _getUserData() async {
    if (_user != null) {
      final userData =
          await _firestore.collection('users').doc(_user!.uid).get();
      setState(() {
        _username = userData['username'];
      });
    }
  }

  Future<void> _updateUserData() async {
    if (_user != null) {
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .set({'username': _username});
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
        title: const Text('Profile'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFE5B2A),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_user != null)
              Column(
                children: <Widget>[
                  if (_user!.photoURL != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(_user!.photoURL!),
                      radius: 50,
                    ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement image upload logic
                    },
                    child: const Text('Change Profile Picture'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                    controller: TextEditingController(text: _username),
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _updateUserData();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
