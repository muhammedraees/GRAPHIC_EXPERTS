import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';
import '../chat/services/auth/auth_gate.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Slide> slides = [
    Slide(
      title: "Find Freelancers",
      styleTitle: const TextStyle(fontSize: 25, color: Color(0xFFFE5B2A)),
      widgetDescription: Column(
        children: [
          Lottie.asset(
            'assets/lotti/find_freelancer2.json', // Replace with your Lottie animation file
            width: 300, // Adjust width and height as needed
            height: 300,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "You can browse and find talented freelancers for your projects.",
              style: TextStyle(
                color: Colors.white, // Adjust text color
                fontSize: 16, // Adjust text size
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
    ),
    Slide(
      title: "Offer Jobs",
      styleTitle: const TextStyle(fontSize: 25, color: Color(0xFFFE5B2A)),
      widgetDescription: Column(
        children: [
          Lottie.asset(
            'assets/lotti/freelancer.json', // Replace with your Lottie animation file
            width: 300, // Adjust width and height as needed
            height: 300,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Post job listings and connect with skilled freelancers.",
              style: TextStyle(
                color: Colors.white, // Adjust text color
                fontSize: 16, // Adjust text size
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
    ),
    Slide(
      title: "Easy Communication",
      styleTitle: const TextStyle(fontSize: 25, color: Color(0xFFFE5B2A)),
      widgetDescription: Column(
        children: [
          Lottie.asset(
            'assets/lotti/connect_eachother.json', // Replace with your Lottie animation file
            width: 300, // Adjust width and height as needed
            height: 300,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Chat and collaborate with freelancers in real time.",
              style: TextStyle(
                color: Colors.white, // Adjust text color
                fontSize: 16, // Adjust text size
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 32, 32, 31),
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        colorActiveDot: const Color(0xFFFE5B2A),
        colorDot: Colors.white,
        doneButtonStyle: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        skipButtonStyle: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        nextButtonStyle: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        slides: slides,
        onDonePress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthGate()),
          );
        },
      ),
    );
  }
}
