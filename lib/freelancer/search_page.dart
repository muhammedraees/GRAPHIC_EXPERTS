

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class UserProfile {
  final String username;
  final String jobType;
  final String experience;
  final String skills;
  final String link;
  final String profileImageURL;

  UserProfile({
    required this.username,
    required this.jobType,
    required this.experience,
    required this.skills,
    required this.link,
    required this.profileImageURL,
  });
}

class SearchProvider extends ChangeNotifier {
  String searchQuery = '';

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  Stream<QuerySnapshot> getSearchResults() {
    return FirebaseFirestore.instance
        .collection('usersprofile')
        .where('username', isGreaterThanOrEqualTo: searchQuery)
        .where('username', isLessThan: searchQuery + 'z')
        .snapshots();
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: _SearchPage(),
    );
  }
}

class _SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Consumer<SearchProvider>(
                builder: (context, provider, child) {
                  return SearchField(
                    onSearch: (query) {
                      provider.setSearchQuery(query);
                    },
                  );
                },
              ),
              Expanded(
                child: Consumer<SearchProvider>(
                  builder: (context, provider, child) {
                    return SearchResultList(searchQuery: provider.searchQuery);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final void Function(String) onSearch;

  const SearchField({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        onChanged: (query) {
          onSearch(query);
        },
        decoration: const InputDecoration(
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
  final String searchQuery;

  const SearchResultList({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Provider.of<SearchProvider>(context).getSearchResults(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final profiles = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return UserProfile(
            username: data['username'],
            jobType: data['jobType'],
            experience: data['experience'],
            skills: data['skills'],
            link: data['link'],
            profileImageURL: data['profile'],
          );
        }).toList();

        return ListView.builder(
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            final profile = profiles[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profile.profileImageURL),
              ),
              title: Text(
                profile.username,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                profile.jobType,
                style: const TextStyle(color: Color.fromARGB(255, 163, 154, 154)),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserProfileDetails(profile: profile),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}


class UserProfileDetails extends StatelessWidget {
  final UserProfile profile; // Change this to UserProfile

  const UserProfileDetails({required this.profile}); // Change this to profile

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
              color: (Color(0xFFFE5B2A)),
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle profile image
                },
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 80,
                    child: profile.profileImageURL != null &&
                            profile.profileImageURL.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.network(
                              profile.profileImageURL,
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              'assets/images/unknown_profile.jpg',
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Username    :  ${profile.username}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Job Type      :  ${profile.jobType}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Experience   :  ${profile.experience}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Skills             :  ${profile.skills}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Link               :  ${profile.link}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
