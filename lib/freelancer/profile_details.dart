import 'package:flutter/material.dart';

import 'profile_editing.dart';

class ProfileDetailsPage extends StatelessWidget {
  //  String? name;
  //  String? jobTitle;
  //  String? experience;
  // final File image;

  // ProfileDetailsPage({
  //    this.name,
  //    this.jobTitle,
  //    this.experience,
  //   // required this.image,
  // });

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
      // AppBar(
      //   backgroundColor: ,
      //   title: Text('Profile Details'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         // Navigate back to the editing page
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => ProfileEditingPage()),
      //         );
      //       },
      //       icon: Icon(Icons.edit), // Pencil icon
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         CircleAvatar(
        //           radius: 60.0,
        //           // backgroundImage: FileImage(image), // Display the user's image
        //         ),
        //         Positioned(
        //           right: 0,
        //           bottom: 0,
        //           child: Container(
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: Colors.white,
        //             ),

        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(height: 20.0),
        //     Text(
        //       'Name: $name',
        //       style: TextStyle(fontSize: 18.0),
        //     ),
        //     SizedBox(height: 10.0),
        //     Text(
        //       'Job Title: $jobTitle',
        //       style: TextStyle(fontSize: 18.0),
        //     ),
        //     SizedBox(height: 10.0),
        //     Text(
        //       'Experience: $experience years',
        //       style: TextStyle(fontSize: 18.0),
        //     ),
        //   ],
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // children:

          children: <Widget>[
            SizedBox(height: 30,),
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
            Text(
              'User Name',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Ajith Kumar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Job type',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Designer',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Experience',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '2 years',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Skills',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Graphics, UI',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Link',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
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
                    // Save the edited details and navigate back to the profile page
                    // Add your save logic here
                    // Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProfileDetailsPage(
                    //       name: nameController.text,
                    //       jobTitle: jobTitleController.text,
                    //       experience: experienceController.text,
                    //       // image: _image!,
                    //     ),
                    //   ),
                    // );
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
