
import 'package:flutter/material.dart';
import 'profile_editing.dart';
class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile Details'),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            const SizedBox(height: 30,),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    'assets/images/unknow_profile.jpg',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'User Name',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'Ajith Kumar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Job type',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'Designer',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Experience',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              '2 years',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Skills',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'Graphics, UI',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Link',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'www.skfgjnsrfkgvn.com',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 90),
            Center(
              child: Container(
                width: 130,
                height: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFFE5B2A))),
                  onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileEditingPage(),
                    ));
                  },
                  child: const Text(
                    'Edit',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
