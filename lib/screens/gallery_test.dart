import 'package:eyedoctor_pro/screens/chatbot_intro.dart';
import 'package:eyedoctor_pro/screens/medicines_info.dart';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryTest extends StatefulWidget {
  const GalleryTest({super.key});

  @override
  State<GalleryTest> createState() => _GalleryTestState();
}

class _GalleryTestState extends State<GalleryTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfface3f4),
                Color(0xff7cc0db),
                Color(0xff57a5c8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Image',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 320,
                  width: 300,
                  child: Image(image: AssetImage('assets/images/kugoo.jpeg'))),
              const SizedBox(height: 20),
              Container(
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Text result of the image",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button_container(
                      text: 'Chatbot',
                      onButtonPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatbotHomeScreen()));
                      }),
                  const SizedBox(width: 20),
                  Button_container(
                      text: 'Medication',
                      onButtonPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicineScreen()));
                      }),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff4497be),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
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
      ),
    );
  }
}
