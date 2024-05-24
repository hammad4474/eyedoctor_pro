import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
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
                      'Gallery',
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
              Center(
                child: Text(
                  'Select Image From',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 320,
                  width: 300,
                  child: Image(image: AssetImage('assets/images/kugoo.jpeg'))),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GallerButton(text: 'Gallery', onButtonPressed: () {}),
                  const SizedBox(width: 20),
                  CameraButton(
                    text: 'Camera',
                    onButtonPressed: () {},
                  ),
                ],
              ),
              const Spacer(),
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
    ;
  }
}
