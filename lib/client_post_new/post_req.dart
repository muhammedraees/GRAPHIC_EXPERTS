import 'package:flutter/material.dart';
import 'post_model_cli.dart';
import 'chat_req.dart';

class PostRequestsPage extends StatefulWidget {
  final Post post;

  PostRequestsPage({required this.post});

  @override
  _PostRequestsPageState createState() => _PostRequestsPageState();
}

class _PostRequestsPageState extends State<PostRequestsPage> {
  late List<String> requests;

  @override
  void initState() {
    super.initState();
    requests = [];
    _loadRequests();
  }

  void _loadRequests() async {
    List<String> result = await _getRequestsForPost(widget.post.postId);
    setState(() {
      requests = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle greyTextStyle = const TextStyle(color: Colors.grey);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Requests for ${widget.post.caption}',
          style: const TextStyle(color: Colors.white),
        ),
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
      body: requests.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) {
                String userEmail = requests[index];
                return ListTile(
                  title: Text(
                    userEmail,
                    style: greyTextStyle,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.thumb_down),
                        onPressed: () {
                          _rejectRequest(userEmail);
                        },
                      ),
                      IconButton(
                        color: const Color(0xFFFE5B2A),
                        icon: const Icon(Icons.thumb_up),
                        onPressed: () {
                          _acceptRequest(userEmail);
                        },
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: const Icon(Icons.playlist_add),
                        onPressed: () {
                          _shortlistUser(userEmail);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    _navigateToChat(context, userEmail);
                  },
                );
              },
            ),
    );
  }

  Future<List<String>> _getRequestsForPost(String postId) async {
    return ['user1@example.com', 'user2@example.com'];
  }

  void _rejectRequest(String userEmail) {
    setState(() {
      requests.remove(userEmail);
    });
  }

  void _acceptRequest(String userEmail) {
    _navigateToChat(context, userEmail);
  }

  void _shortlistUser(String userEmail) {}

  void _navigateToChat(BuildContext context, String userEmail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatRequestPage(
          receiverUserEmail: userEmail,
          receiverUserID: userEmail,
          receiverUserId: '',
        ),
      ),
    );
  }
}
