import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChatListItem(
              username: 'Ajith',
              lastMessage: 'Hello!',
              time: '2h ago',
              onTap: () {
              
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      username: 'User 1',
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ChatListItem(
              username: 'Kiran',
              lastMessage: 'How are you doing?',
              time: '1d ago',
              onTap: () {
        
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      username: 'User 2',
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ChatListItem(
              username: 'Tom',
              lastMessage: 'Good morning!',
              time: '3d ago',
              onTap: () {
              
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      username: 'User 3',
                    ),
                  ),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
           
          ],
        ),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String username;
  final String lastMessage;
  final String time;
  final VoidCallback onTap;

  const ChatListItem({super.key, 
    required this.username,
    required this.lastMessage,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 30,
        child: Text(
          username.substring(0, 1), 
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        username,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        lastMessage,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      trailing: Text(
        time,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
      onTap: onTap, 
    );
  }
}

class ChatPage extends StatelessWidget {
  final String username;

  const ChatPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: Text(
          username,
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
    
                ChatMessage(text: 'Hello', isSentByMe: true),
                ChatMessage(text: 'Hi there!', isSentByMe: false),
          
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions),
                    onPressed: () {

                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
          
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  const ChatMessage({super.key, required this.text, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.orange[900] : Colors.grey[300],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
