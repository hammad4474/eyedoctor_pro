import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eyedoctor_pro/auth/login_screen.dart';
import 'package:eyedoctor_pro/auth/signup_screen.dart';
import 'package:eyedoctor_pro/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showText = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 400,
        duration: 6000,
        backgroundColor: Color(0xffceecfa),
        splash: Column(
          children: [
            Center(child: LottieBuilder.asset('assets/Lottie/animation2.json')),
            SizedBox(
              height: 40,
            ),
            AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 4000),
              child: AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('Eye Doctor Pro',
                    textStyle: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ]),
            ),
          ],
        ),
        nextScreen: SignupScreen());
  }
}
