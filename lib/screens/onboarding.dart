import 'package:flutter/material.dart';
import 'package:graphic_experts/auth_steps/user_auth/presentation/pages/login_page.dart';
import 'package:intro_slider/intro_slider.dart';

// import '../freelancer/profile_editing.dart';
import 'select_user.dart';
// import 'signup.dart';

// class OnboardingPage extends StatefulWidget {
//   const OnboardingPage({Key? key, required LoginPage child}) : super(key: key);

//   @override
//   _OnboardingPageState createState() => _OnboardingPageState();
// }

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key, required LoginPage child}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Slide> slides = [
    Slide(
      title: "Find Freelancers",
      styleTitle: TextStyle(fontSize: 25, color: Color(0xFFFE5B2A)),
      description: "Browse and hire talented freelancers for your projects.",
      pathImage: 'assets/images/freelancer_onboarding.png',
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
    ),
    Slide(
      title: "Offer Jobs",
      styleTitle: TextStyle(fontSize: 25, color: Color(0xFFFE5B2A)),
      description: "Post job listings and connect with skilled freelancers.",
      pathImage: 'assets/images/job-offer-onboarding.jpg',
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
    ),
    Slide(
      title: "Easy Communication",
      styleTitle: TextStyle(fontSize: 25, color: Color(0xFFFE5B2A)),
      description: "Chat and collaborate with freelancers in real-time.",
      pathImage: 'assets/images/connect_onboarding.jpg',
      backgroundColor: Color.fromARGB(255, 32, 32, 31),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        colorActiveDot: Color(0xFFFE5B2A),
        colorDot: Colors.white,
        doneButtonStyle: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        skipButtonStyle: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        nextButtonStyle: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        slides: slides,
        onDonePress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserTypeSelectionPage(),
            ),
          );
        },
      ),
    );
  }
}
