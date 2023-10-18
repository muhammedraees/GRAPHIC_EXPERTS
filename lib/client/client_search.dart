import 'package:flutter/material.dart';


class ClientSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Search Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(), 
            Expanded(
              child: SearchResultList(), 
            ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}

class SearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: Text('Search results will appear here.'),
    );
  }
}