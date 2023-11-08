import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';
import 'chat_page.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({super.key});

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
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
          'Chat List',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading..');
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }
  // Widget _buildUserListItem(DocumentSnapshot document){
  //   Map<String,dynamic> data = document.data()! as Map<String,dynamic>;

  //   if(_auth.currentUser!.email != data['email']){
  //     return ListTile(
  //       title: Text(data['email']),
  //       onTap: (){
  //         Navigator.push(context,
  //         MaterialPageRoute(builder: (context)=>ChatPage(
  //           receiverUserEmail: data['email'],
  //           receiverUserID: data['uid'],
  //         ),)
  //         );
  //       },
  //     );
  //   }else{
  //     return Container();
  //   }
  // }
  Widget _buildUserListItem(DocumentSnapshot document) {
  Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

  if (data != null) {
    String? userEmail = data['email'];
    if (userEmail != null &&
        _auth.currentUser != null &&
        _auth.currentUser!.email != userEmail) {
      return Column(
        children: [
          ListTile(
            title: Text(
              userEmail,
              style: TextStyle(color: Colors.grey), // Set text color to grey
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverUserEmail: userEmail,
                    receiverUserID: data['uid'],
                  ),
                ),
              );
            },
          ),
          Divider(
            color: Colors.grey, // Set separator color to grey
          ),
        ],
      );
    }
  }

  return Container();
}

}
