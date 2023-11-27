
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'profile_full_view.dart';

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

class YourProviderClass extends ChangeNotifier {
  String? selectedJobType;
  List<UserProfile> profiles = [];

  void fetchUserProfiles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('usersprofile').get();
    if (snapshot.docs.isNotEmpty) {
      profiles = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserProfile(
          username: data['username'] ?? '',
          jobType: data['jobType'] ?? '',
          experience: data['experience'] ?? '',
          skills: data['skills'] ?? '',
          link: data['link'] ?? '',
          profileImageURL: data['profile'] ?? '',
        );
      }).toList();
      notifyListeners(); 
    }
  }

  List<DropdownMenuItem<String>> getJobTypeDropdownItems() {
    final jobTypes = ['All', 'Designer', 'Developer', 'Digital Marketing'];
    return jobTypes.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  List<UserProfile> get filteredProfiles {
    if (selectedJobType == null || selectedJobType == 'All') {
      return profiles;
    } else {
      return profiles
          .where((profile) => profile.jobType == selectedJobType)
          .toList();
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourProviderClass(),
      child: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  __HomePageState createState() => __HomePageState();
}

class __HomePageState extends State<_HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<YourProviderClass>(context, listen: false).fetchUserProfiles();
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
          'Home',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Consumer<YourProviderClass>(
        builder: (context, provider, child) {
          return _buildHomePage(provider);
        },
      ),
    );
  }

  Widget _buildHomePage(YourProviderClass provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButton<String>(
            value: provider.selectedJobType,
            onChanged: (newValue) {
              setState(() {
                provider.selectedJobType = newValue;
              });
            },
            items: provider.getJobTypeDropdownItems(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: (provider.filteredProfiles.length / 2).ceil(),
            itemBuilder: (context, index) {
              final startIdx = index * 2;
              final endIdx = startIdx + 2;

              return Row(
                children: [
                  for (var i = startIdx; i < endIdx; i++)
                    if (i < provider.filteredProfiles.length)
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            showProfileDialog(
                                context, provider.filteredProfiles[i]);
                          },
                          child: Card(
                            color: const Color.fromARGB(255, 45, 45, 45),
                            elevation: 2,
                            margin: const EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          provider.filteredProfiles[i]
                                                      .profileImageURL !=
                                                  null
                                              ? provider.filteredProfiles[i]
                                                  .profileImageURL
                                              : 'assets/images/unknown_profile.jpg',
                                        ),
                                        radius: 50,
                                      ),
                                      if (provider.filteredProfiles[i]
                                              .profileImageURL ==
                                          null)
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/unknown_profile.jpg',
                                              width: 100,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    '${provider.filteredProfiles[i].username}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    provider.filteredProfiles[i].jobType,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    provider.filteredProfiles[i].experience,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    provider.filteredProfiles[i].skills,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    provider.filteredProfiles[i].link,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  void showProfileDialog(BuildContext context, UserProfile profile) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: FullProfileDialog(profile: profile),
        );
      },
    );
  }
}
