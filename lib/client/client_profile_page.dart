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
      final userData = await _firestore.collection('users').doc(_user!.uid).get();
      setState(() {
        _username = userData['username'];
      });
    }
  }

  Future<void> _updateUserData() async {
    if (_user != null) {
      await _firestore.collection('users').doc(_user!.uid).set({'username': _username});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Profile'),
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
                    child: Text('Change Profile Picture'),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                    controller: TextEditingController(text: _username),
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _updateUserData();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}