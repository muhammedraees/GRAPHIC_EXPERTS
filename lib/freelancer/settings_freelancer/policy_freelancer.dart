import 'package:flutter/material.dart';

class FreelancerPrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 32, 31),
        elevation: 0,
        centerTitle: true,
        title: const Text('Privacy Policy'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFE5B2A),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Muhammed Raees built the Graphic Experts app as a Free app. This SERVICE is provided by Muhammed Raees at no cost and is intended for use as is.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Graphic Experts unless otherwise defined in this Privacy Policy.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Information Collection and Use',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Email, skills, experience, name, social media link or web site link, job type, image. The information that I request will be retained on your device and is not collected by me in any way.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'The app does use third-party services that may collect information used to identify you.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Link to the privacy policy of third-party service providers used by the app',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '- Google Play Services',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Log Data',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Cookies',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device\'s internal memory.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Service Providers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'I may employ third-party companies and individuals due to the following reasons:',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '- To facilitate our Service;',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '- To provide the Service on our behalf;',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '- To perform Service-related services; or',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                '- To assist us in analyzing how our Service is used.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Security',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Links to Other Sites',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Children’s Privacy',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'Changes to This Privacy Policy',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                'This policy is effective as of 2023-11-25',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at muhammedraees911@gmail.com.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
