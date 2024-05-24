import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  String heartEmoji = String.fromCharCode(0x2764);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xfface3f4),
            Color(0xff7cc0db),
            Color(0xff57a5c8),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                "Medicines",
                style: GoogleFonts.nunitoSans(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 183,
              width: 297,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                  child: Text(
                "Panadol",
                style: GoogleFonts.nunitoSans(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 145),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  height: 49,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Color(0xff4c9dc2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white)),
                  child: Center(
                      child: Text(
                    'Consult',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 4,
              child: Container(
                height: 267,
                width: 327,
                decoration: BoxDecoration(
                  color: Color(0xffd6f6ff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                              speed: Duration(milliseconds: 100),
                              "Disclaimer: This information is for general purposes only. Consult a healthcare professional before taking any medication. Self-prescribing is done at your own risk, and you are responsible for the consequences."),
                          TypewriterAnimatedText(
                              speed: Duration(milliseconds: 100),
                              "Conjunctivitis, also known as pink eye, is a common eye infection affecting the conjunctiva, the thin membrane covering the eye's white part.$heartEmoji"),
                          TypewriterAnimatedText(
                              speed: Duration(milliseconds: 100),
                              "It's essential to consult with a healthcare professional for a proper diagnosis and treatment plan, especially if symptoms persist or worsen.$heartEmoji"),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff4497be),
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        elevation: 5,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.file),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: 'ChatBot',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tablets),
            label: 'Medication',
          ),
        ],
        // currentIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
      ),
    ));
  }
}
