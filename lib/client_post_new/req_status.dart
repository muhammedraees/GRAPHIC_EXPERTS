import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'post_model_cli.dart';

class UserRequestsPage extends StatefulWidget {
  final String userId; 

  UserRequestsPage({required this.userId});

  @override
  _UserRequestsPageState createState() => _UserRequestsPageState();
}

class _UserRequestsPageState extends State<UserRequestsPage> {
  late List<Request> userRequests;

  @override
  void initState() {
    super.initState();
    userRequests = []; 
    _loadUserRequests();
  }

  void _loadUserRequests() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('requests')
          .where('userId', isEqualTo: widget.userId)
          .get();

      setState(() {
        userRequests = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Request(
            postId: data['postId'],
            status: data['status'],
          );
        }).toList();
      });
    } catch (e) {
      print('Error fetching user requests: $e');
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
        title: const Text('Your Requests'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: userRequests.isEmpty
          ? const Center(child: Text('No requests',style: TextStyle(color: Colors.grey),))
          : ListView.builder(
              itemCount: userRequests.length,
              itemBuilder: (context, index) {
                final request = userRequests[index];
                return FutureBuilder<Post>(
                  future: _getPostDetails(request.postId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ListTile(
                        title: Text('Loading...'),
                      );
                    } else if (snapshot.hasError) {
                      return ListTile(
                        title: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      final post = snapshot.data!;
                      return ListTile(
                        title: Text(post.caption),
                        subtitle: Text(_getStatusText(request.status)),
                      );
                    }
                  },
                );
              },
            ),
    );
  }

  Future<Post> _getPostDetails(String postId) async {
    DocumentSnapshot postSnapshot =
        await FirebaseFirestore.instance.collection('posts').doc(postId).get();
    final postData = postSnapshot.data() as Map<String, dynamic>;
    return Post(
      userId: postData['userId'],
      image: postData['image'],
      caption: postData['caption'],
      userEmail: '',
      postId: postId,
    );
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'accepted':
        return 'Accepted';
      case 'rejected':
        return 'Rejected';
      case 'shortlisted':
        return 'Shortlisted';
      default:
        return 'Pending'; 
    }
  }
}

class Request {
  final String postId;
  final String status;

  Request({required this.postId, required this.status});
}
