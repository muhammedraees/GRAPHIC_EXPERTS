
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
      appBar: AppBar(
        title: const Text('Home Page'),
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
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text('Loading..');
        }
        return ListView(
          children: snapshot.data!.docs
          .map<Widget>((doc)=>_buildUserListItem(doc))
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
    if (userEmail != null && _auth.currentUser != null && _auth.currentUser!.email != userEmail) {
      return ListTile(
        title: Text(userEmail),
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
      );
    }
  }
  
  return Container();
}

}
